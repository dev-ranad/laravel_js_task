<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductVariant extends Model
{
    protected $fillable = [
        'variant', 'variant_id', 'product_id'
    ];

    protected $casts = [
        'variant' => 'string',
        'variant_id' => 'integer',
        'product_id' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function product_variant_one(): HasMany
    {
        return $this->hasMany(ProductVariantPrice::class, 'product_variant_one', 'id');
    }

    public function product_variant_two(): HasMany
    {
        return $this->hasMany(ProductVariantPrice::class, 'product_variant_two', 'id');
    }

    public function product_variant_three(): HasMany
    {
        return $this->hasMany(ProductVariantPrice::class, 'product_variant_three', 'id');
    }
}
