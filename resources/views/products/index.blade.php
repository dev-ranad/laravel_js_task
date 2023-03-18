@extends('layouts.app')

@section('content')
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Products</h1>
    </div>


    <div class="card">
        <form action="{{ route('search.product') }}" method="post" class="card-header">
            @csrf
            <div class="form-row justify-content-between">
                <div class="col-md-2">
                    <input type="text" name="title" placeholder="Product Title" class="form-control">
                </div>
                <div class="col-md-2">
                    <select name="variant" id="" class="form-control" title="Choose Option">
                        @foreach ($variants as $variant)
                            <optgroup label="{{ $variant->title }}">
                                @foreach ($variant->productVariant as $productVariant)
                                    <option value="{{ $productVariant->id }}">{{ $productVariant->variant }}</option>
                                @endforeach
                            </optgroup>
                        @endforeach
                    </select>
                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Price Range</span>
                        </div>
                        <input type="text" name="price_from" aria-label="From" placeholder="From" class="form-control">
                        <input type="text" name="price_to" aria-label="To" placeholder="To" class="form-control">
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="date" name="date" placeholder="Date" class="form-control">
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary float-right"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>

        <div class="card-body">
            <div class="table-response">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Variant</th>
                            <th width="150px">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td>1</td>
                                <td>{{ $product->title }} <br> Created at : {{ $product->created_at->format('d-M-Y') }}</td>
                                <td>{{ Str::limit($product->description, 75) }}</td>
                                <td>
                                    <dl class="row mb-0" style="height: 80px; overflow: hidden"
                                        id="variant{{ $product->id }}">

                                        <dt class="col-sm-3 pb-0">
                                            @foreach ($product->variant as $variant)
                                                {{ $variant->variant }} /
                                            @endforeach
                                        </dt>
                                        <dd class="col-sm-9">
                                            <dl class="row mb-0">
                                                <dt class="col-sm-4 pb-0">Price :
                                                    {{ number_format($product->variantPrice->first()->price, 2) }}</dt>
                                                <dd class="col-sm-8 pb-0">InStock :
                                                    {{ $product->variantPrice->first()->stock }}</dd>
                                            </dl>
                                        </dd>
                                    </dl>
                                    <button onclick="$('#variant{{ $product->id }}').toggleClass('h-auto')"
                                        class="btn btn-sm btn-link">Show more</button>
                                </td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <a href="{{ route('product.edit', $product->id) }}"
                                            class="btn btn-success">Edit</a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>

                </table>
            </div>

        </div>

        <div class="card-footer">
            <div class="row justify-content-between">
                <div class="col-md-6">
                    <p>Showing {{ $products->firstItem() }} to {{ $products->lastItem() }} out of
                        {{ count($products) }}
                    </p>
                </div>
                <div class="col-md-2">
                    {{ $products->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
