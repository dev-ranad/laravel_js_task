<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductVariantPrice extends Model
{
    protected $fillable = [
        'product_variant_one',
        'product_variant_two',
        'product_variant_three',
        'price',
        'stock',
        'product_id'
    ];

    protected $casts = [
        'product_variant_one' => 'integer',
        'product_variant_two' => 'integer',
        'product_variant_three' => 'integer',
        'price' => 'dicimal',
        'stock' => 'integer',
        'product_id' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function variant_one(): BelongsTo
    {
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_one');
    }

    public function variant_two(): BelongsTo
    {
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_two');
    }

    public function variant_three(): BelongsTo
    {
        return $this->belongsTo(ProductVariant::class, 'id', 'product_variant_three');
    }

}
