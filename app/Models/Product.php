<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

class Product extends Model
{
    protected $fillable = [
        'title', 'sku', 'description'
    ];

    protected $casts = [
        'title' => 'string',
        'sku' => 'string',
        'description' => 'string',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function thumbnail(): HasMany
    {
        return $this->hasMany(ProductImage::class);
    }

    public function variant(): HasMany
    {
        return $this->hasMany(ProductVariant::class);
    }

    public function variantPrice(): HasMany
    {
        return $this->hasMany(ProductVariantPrice::class);
    }

    // public function variantPrice(): HasManyThrough
    // {
    //     return $this->hasManyThrough(
    //         ProductVariantPrice::class,
    //         ProductVariant::class,
    //         'product_id', // Foreign key on the environments table...
    //         'product_variant_one', // Foreign key on the deployments table...
    //         'id', // Local key on the projects table...
    //         'id' // Local key on the environments table...
    //     );
    // }
}
