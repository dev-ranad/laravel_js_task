<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Image;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function dropzone(Request $request, $id = null)
    {
        if ($id) {
            $product = Product::where('id', $id)->first();
            $productImage = new ProductImage();
            $productData = ProductImage::where('thumbnail', $product->id)->get();
            $productImage->thumbnail = $product->id;
        } else {
            $product = Product::orderby('created_at', 'DESC')->first();
            $productImage = new ProductImage();
            $productData = ProductImage::where('thumbnail', $product->id + 1)->get();
            $productImage->thumbnail = $product->id + 1;
        }

        if ($request->hasFile('file')) {
            $thumbnail = $request->file('file');
            $thumbnail_name = 'thumb_' . rand() . '.' . $thumbnail->getClientOriginalExtension();
            $thumbnail_resize = Image::make($thumbnail->getRealPath());
            $thumbnail_resize->resize(512, 512);
            $thumbnail_resize->save(public_path('upload/product/' . $thumbnail_name));
            $productImage->file_path = 'uploads/product/' . $thumbnail_name;
        }
        $productImage->product_id = $product->id;
        $productImage->save();

        $response = array();
        foreach ($productData as $data) {
            $response[] = array("id" => $data->id, "product_id" => $data->thumbnail);
        }
        if ($productImage) {
            return response()->json([
                'status' => 200,
                'value' => json_encode($response)
            ]);
        } else {
            return response()->json([
                'status' => 400,
                'value' => 'Something wrong! Enter valid file.'
            ]);
        }
    }
}
