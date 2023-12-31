<?php

namespace App\Repositories;

use App\Models\Transation;
use App\Repositories\BaseRepository;

class TransationRepository extends BaseRepository
{
    protected $fieldSearchable = [
        'user_id',
        'qrcode_owner_id',
        'qrcode_id',
        'payment_method',
        'message',
        'amount',
        'status'
    ];

    public function getFieldsSearchable(): array
    {
        return $this->fieldSearchable;
    }

    public function model(): string
    {
        return Transation::class;
    }
}
