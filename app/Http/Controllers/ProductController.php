<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Models\Variant;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function index()
    {
        $products = Product::orderby('created_at', 'DESC')->with('variant', 'variantPrice')->paginate(2);
        $variants = Variant::with('productVariant')->get();
        // dd($products);
        return view('products.index', compact('products', 'variants'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function create()
    {
        $variants = Variant::all();
        return view('products.create', compact('variants'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'product_name' => 'required|max:50|string',
            'product_sku' => 'required|unique:products,sku',
            'product_description' => 'required|max:6400',

            'product_variant.*.option' => 'required|numeric',
            'product_variant.*.value' => 'required_with:product_variant.*.option|max:8',

            'product_preview.*.variant' => 'required_with:product_preview.*.value',
            'product_preview.*.price' => 'required_with:product_preview.*.variant|numeric|gt:0',
            'product_preview.*.stock' => 'required_with:product_preview.*.variant|numeric|gt:0',
        ]);

        $product = new Product();
        $productVariant = new ProductVariant();
        $productVariantPrice = new ProductVariantPrice();

        $variantDataArr = array();
        $previewDataArr = array();

        $product->title = $request->product_name;
        $product->sku = $request->product_sku;
        $product->description = $request->product_description;
        $product->save();
        if ($product) {
            if($request->image_data != null) {
                foreach(json_decode($request->image_data) as $image_data){
                    $productImage = ProductImage::where('thumbnail', $product->id)->update([
                        'product_id' => $product->id
                    ]);
                }
            }

            foreach ($request->product_variant as $variantData) {
                if (count($variantData['value']) >= 1) {
                    foreach ($variantData['value'] as $variant) {
                        $variantDataArr['variant'] = $variant;
                        $variantDataArr['variant_id'] = $variantData['option'];
                        $variantDataArr['product_id'] = $product->id;
                        $productVariant::create($variantDataArr);
                    }
                } else {
                    $variantDataArr['variant_id'] = $variantData['option'];
                    $variantDataArr['product_id'] = $product->id;
                    $productVariant::create($variantDataArr);
                }
            }

            if ($productVariant) {
                foreach ($request->product_preview as $previewData) {
                    $variant = explode('/', $previewData['variant']);
                    $product_variants = ProductVariant::where('product_id', $product->id)->get();
                    foreach($product_variants as $key => $product_variant){
                        $previewDataArr['product_variant_one'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                        $previewDataArr['product_variant_two'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                        $previewDataArr['product_variant_three'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                    }
                    $previewDataArr['price'] = $previewData['price'];
                    $previewDataArr['stock'] = $previewData['stock'];
                    $previewDataArr['product_id'] = $product->id;
                    $productVariantPrice::create($previewDataArr);
                }
            }
        }

          return back()->with('success','Product Added Successfully');
    }


    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $product = Product::where('id', $product->id)->with('variant', 'variantPrice')->first();
        $variants = Variant::all();
        $productVariants = ProductVariant::where('product_id', $product->id)->get();
        // dd($productVariants);
        return view('products.edit', compact('product', 'variants', 'productVariants'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->validate($request, [
            'product_name' => 'max:50|string',
            'product_sku' => 'max:50|string',
            'product_description' => 'max:6400',

            'product_variant.*.option' => 'numeric',
            'product_variant.*.value' => 'max:8',

            'product_preview.*.price' => 'numeric|gt:0',
            'product_preview.*.stock' => 'numeric|gt:0',
        ]);

        $product = Product::find($product->id);
        $productVariant = ProductVariant::where('product_id', $product->id)->get();
        $productVariantPrice = ProductVariantPrice::where('product_id', $product->id)->get();

        $variantDataArr = array();
        $previewDataArr = array();

        $product->title = $request->product_name;
        $product->sku = $request->product_sku;
        $product->description = $request->product_description;
        $product->save();
        if ($product) {
            if($request->image_data != null) {
                foreach(json_decode($request->image_data) as $image_data){
                    $productImage = ProductImage::where('thumbnail', $product->id)->update([
                        'product_id' => $product->id
                    ]);
                }
            }

            foreach ($productVariant as $variantData) {
                if (count($variantData['value']) >= 1) {
                    foreach ($variantData['value'] as $variant) {
                        $variantDataArr['variant'] = $variant;
                        $variantDataArr['variant_id'] = $variantData['option'];
                        $variantDataArr['product_id'] = $product->id;
                        $productVariant::create($variantDataArr);
                    }
                } else {
                    $variantDataArr['variant_id'] = $variantData['option'];
                    $variantDataArr['product_id'] = $product->id;
                    $productVariant::create($variantDataArr);
                }
            }

            if ($productVariant) {
                foreach ($request->product_preview as $previewData) {
                    $variant = explode('/', $previewData['variant']);
                    $product_variants = ProductVariant::where('product_id', $product->id)->get();
                    foreach($product_variants as $key => $product_variant){
                        $previewDataArr['product_variant_one'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                        $previewDataArr['product_variant_two'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                        $previewDataArr['product_variant_three'] = $product_variant->where('variant', $variant[$key])->first()->id ?? null;
                    }
                    $previewDataArr['price'] = $previewData['price'];
                    $previewDataArr['stock'] = $previewData['stock'];
                    $previewDataArr['product_id'] = $product->id;
                    $productVariantPrice::create($previewDataArr);
                }
            }
        }

          return back()->with('success','Product Added Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }

    public function search_product(Request $request)
    {
//  dd($request->all());
        $variant = $request->variant;
        $price_from = $request->price_from;
        $price_to = $request->price_to;
        // $date = Carbon::createFromFormat('Y-m-d', $request->date);
        $products = Product::where('title', 'LIKE', '%' .$request->title. '%')
        ->orWhereHas('variant', function($query) use ($variant) {
            return $query->where('id', $variant);
        })->orWhereHas('variantPrice', function($query) use ($price_from, $price_to) {
                return $query->whereBetween('price', [$price_from, $price_to]);
        })
        ->whereDate('created_at', $request->date)
        ->orderby('created_at', 'DESC')->with('variant', 'variantPrice')->paginate(10);
        // dd($products);
        $variants = Variant::with('productVariant')->get();

        return view('products.index', compact('products', 'variants'));
    }
}
