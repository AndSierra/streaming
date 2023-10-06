<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
/**
 * @OA\Schema(
 *      schema="Transaction",
 *      required={"user_id","qrcode_id","amount","status"},
 *      @OA\Property(
 *          property="payment_method",
 *          description="",
 *          readOnly=false,
 *          nullable=true,
 *          type="string",
 *      ),
 *      @OA\Property(
 *          property="message",
 *          description="",
 *          readOnly=false,
 *          nullable=true,
 *          type="string",
 *      ),
 *      @OA\Property(
 *          property="amount",
 *          description="",
 *          readOnly=false,
 *          nullable=false,
 *          type="number",
 *          format="number"
 *      ),
 *      @OA\Property(
 *          property="status",
 *          description="",
 *          readOnly=false,
 *          nullable=false,
 *          type="string",
 *      ),
 *      @OA\Property(
 *          property="created_at",
 *          description="",
 *          readOnly=true,
 *          nullable=true,
 *          type="string",
 *          format="date-time"
 *      ),
 *      @OA\Property(
 *          property="updated_at",
 *          description="",
 *          readOnly=true,
 *          nullable=true,
 *          type="string",
 *          format="date-time"
 *      ),
 *      @OA\Property(
 *          property="deleted_at",
 *          description="",
 *          readOnly=true,
 *          nullable=true,
 *          type="string",
 *          format="date-time"
 *      )
 * )
 */class Transaction extends Model
{
     use SoftDeletes;    public $table = 'transactions';

    public $fillable = [
        'user_id',
        'qrcode_owner_id',
        'qrcode_id',
        'payment_method',
        'message',
        'amount',
        'status'
    ];

    protected $casts = [
        'payment_method' => 'string',
        'message' => 'string',
        'amount' => 'float',
        'status' => 'string'
    ];

    public static array $rules = [
        'user_id' => 'required',
        'qrcode_owner_id' => 'nullable',
        'qrcode_id' => 'required',
        'payment_method' => 'nullable|string|max:255',
        'message' => 'nullable|string',
        'amount' => 'required|numeric',
        'status' => 'required|string|max:255',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable'
    ];

    /**
     * Get the user that owns the transactions.
     */

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function qrcodes(): HasMany
    {
        return $this->hasMany(Qrcode::class);
    }
    

    public function qrcode(): BelongsTo
    {
        return $this->belongsTo(Qrcode::class);
    }
    public function product()
    {
        return $this->BelongsTo(Qrcode::class, 'qrcode_id')->select('product_name');
    }
}
