<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BuyChannelStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name_channel' => 'required|string',
            'price' => 'required',
            'date_publication' => 'required'
        ];
    }
}
