@extends('layouts.app')

@section('content')
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Edit Product</h1>
    </div>
    <form action="{{ route('product.update', $product->id) }}" method="post" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <section>
            <div class="row">
                <div class="col-md-6">
                    <!--                    Product-->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                        </div>
                        <div class="card-body border">
                            <div class="form-group">
                                <label for="product_name">Product Name</label>
                                <input type="text" name="product_name" id="product_name" required
                                    value="{{ $product->title }}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="product_sku">Product SKU</label>
                                <input type="text" name="product_sku" id="product_sku" required
                                    value="{{ $product->sku }}" class="form-control">
                            </div>
                            <div class="form-group mb-0">
                                <label for="product_description">Description</label>
                                <textarea name="product_description" id="product_description" required rows="4" class="form-control">{{ $product->description }}</textarea>
                            </div>
                        </div>
                    </div>
                    <!--                    Media-->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Media</h6>
                        </div>
                        <div class="card-body border">
                            <div id="file-upload" class="dropzone dz-clickable">
                                <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                            </div>
                            <p id="imagge_msg"></p>
                        </div>
                        <input type="hidden" name="image_data" id="image_data">
                    </div>
                </div>
                <!--                Variants-->
                <div class="col-md-6">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Variants</h6>
                        </div>
                        <div class="card-body pb-0 variant-sections-js" id="variant-sections">
                        </div>
                        <div class="card-footer bg-white border-top-0" id="add-btn">
                            <div class="row d-flex justify-content-center">
                                <button class="btn btn-primary add-btn" onclick="addVariant(event);">
                                    Add another option
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow">
                        <div class="card-header text-uppercase">Preview</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr class="text-center">
                                            <th width="33%">Variant</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody id="variant-previews">
                                        @foreach ($product->variantPrice as $key => $value)
                                            <tr>
                                                <th>
                                                    <input type="hidden"
                                                        name="product_preview[{{ $key }}][variant]"
                                                        value="{{ $product->variant->where('id', $value->product_variant_one)->first()->variant .'/'. $product->variant->where('id', $value->product_variant_two)->first()->variant .'/'. $product->variant->where('id', $value->product_variant_three)->first()->variant }}">
                                                    <span
                                                        class="font-weight-bold">{{ $product->variant->where('id', $value->product_variant_one)->first()->variant .'/'. $product->variant->where('id', $value->product_variant_two)->first()->variant .'/'. $product->variant->where('id', $value->product_variant_three)->first()->variant }}</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" value="{{ $value->price }}"
                                                        name="product_preview[{{ $key }}][price]" required>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" value="{{ $value->stock }}"
                                                        name="product_preview[{{ $key }}][stock]">
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-lg btn-primary">Save</button>
            <button type="button" class="btn btn-secondary btn-lg">Cancel</button>
        </section>
    </form>
@endsection

{{-- @push('page_js')
    <script type="text/javascript" src="{{ asset('js/product.js') }}"></script>
@endpush --}}

@push('script')
    <script>
        var currentIndex = 0;
        var indexs = [];

        var product_id = '{{ $product->id }}';

        $(document).ready(function() {
            addVariantTemplate();
            $("#file-upload").dropzone({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{ url('/dropzone/') }}" + "/" + product_id,
                method: "post",
                addRemoveLinks: true,
                success: function(file, response) {
                    $('#image_data').val(response.value);
                },
                error: function(file, response) {
                    $('#image_msg').text(response.value);
                }
            });


        });

        function addVariant(event) {
            event.preventDefault();
            addVariantTemplate();
        }

        function getCombination(arr, pre) {

            pre = pre || '';

            if (!arr.length) {
                return pre;
            }

            return arr[0].reduce(function(ans, value) {
                return ans.concat(getCombination(arr.slice(1), pre + value + '/'));
            }, []);
        }

        function updateVariantPreview() {
            var valueArray = [];

            $(".select2-value").each(function() {
                valueArray.push($(this).val());
            });

            var variantPreviewArray = getCombination(valueArray);


            var tableBody = '';

            var variantPreviewArray = JSON.parse(atob('{{ base64_encode($product->variantPrice->toJson()) }}'));
            // console.log(variantPreviewArray);
            $(variantPreviewArray).each(function(index, element) {
                tableBody += `<tr>
                        <th>
                                        <input type="hidden" name="product_preview[${index}][variant]" value="${element}">
                                        <span class="font-weight-bold">${element}</span>
                                    </th>
                        <td>
                                        <input type="text" class="form-control" value="0" name="product_preview[${index}][price]" required>
                                    </td>
                        <td>
                                        <input type="text" class="form-control" value="0" name="product_preview[${index}][stock]">
                                    </td>
                      </tr>`;
            });

            $("#variant-previews").empty().append(tableBody);
        }

        function addVariantTemplate() {
            var sel = ``;
            var variant = JSON.parse(atob('{{ base64_encode($product->variant->toJson()) }}'));
            $.each(variant, function(key, variant) {
                $("#variant-sections").append(`<div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Option</label>
                                        <select id="select2-option-${currentIndex}" data-index="${currentIndex}" name="product_variant[${currentIndex}][option]" class="form-control custom-select select2 select2-option select2-option-js">

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label class="d-flex justify-content-between">
                                            <span>Value</span>
                                            <a href="#" class="remove-btn" data-index="${currentIndex}" onclick="removeVariant(event, this);">Remove</a>
                                        </label>
                                        <select id="select2-value-${currentIndex}" data-index="${currentIndex}" name="product_variant[${currentIndex}][value][]" class="select2 select2-value form-control custom-select" multiple="multiple">

                                            </select>
                                    </div>
                                </div>
                            </div>`);

                $(`#select2-option-${currentIndex}`).select2({
                    placeholder: "Select Option",
                    theme: "bootstrap4"
                });

                $(`#select2-value-${currentIndex}`)
                    .select2({
                        data: [variant.variant],
                        tags: true,
                        multiple: true,
                        placeholder: "Type tag name",
                        allowClear: true,
                        theme: "bootstrap4"

                    })
                    .on('change', function() {
                        updateVariantPreview();
                    });

                indexs.push(currentIndex);

                currentIndex = (currentIndex + 1);

                if (indexs.length >= 3) {
                    $("#add-btn").hide();
                } else {
                    $("#add-btn").show();
                }

                var dataSet = JSON.parse(atob('{{ base64_encode($variants->toJson()) }}'));
                $.each(dataSet, function(key, value) {
                    if (value.id == variant.id) {
                        sel = `selected`;
                    } else {
                        sel = ``;
                    }
                    $('.select2-option-js').append(`<option value="${value.id}" ${sel}>
                        ${value.title}
                                            </option>`)
                });

            });

        }

        function removeVariant(event, element) {

            event.preventDefault();

            var jqElement = $(element);

            var position = indexs.indexOf(jqElement.data('index'))

            indexs.splice(position, 1)

            jqElement.parent().parent().parent().parent().remove();

            if (indexs.length >= 3) {
                $("#add-btn").hide();
            } else {
                $("#add-btn").show();
            }

            updateVariantPreview();
        }
    </script>
@endpush
