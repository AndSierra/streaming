<?php

namespace App\Repositories;

use App\Models\Qrcode;
use App\Repositories\BaseRepository;

class QrcodeRepository extends BaseRepository
{
    protected $fieldSearchable = [
        'user_id',
        'website',
        'company_name',
        'product_name',
        'product_url',
        'callback_url',
        'qrcode_path',
        'amount',
        'product_url_image_path'
    ];

    public function getFieldsSearchable(): array
    {
        return $this->fieldSearchable;
    }

    public function model(): string
    {
        return Qrcode::class;
    }
}
