<?php

namespace App\Repository;


use Illuminate\Database\Eloquent\Collection;
use App\Models\Promo as Model;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class PromoRepository extends CoreRepository
{
    /**
     * Получить модель для редактирования в админке
     *
     * @param int $id
     *
     * @retrurn Model
     */
    protected function getModelClass()
    {
        return Model::class;
    }
    /**
     * Почуть список промо и выбрать первый
     * неактивированный промокод
     *
     * @return LengthAwarePaginator
     */
    public function getPromo()
    {
        // CONCAT Соединение 2 строк id + "." + title = id_title
        $columns = [
            'id',
            'promo',
            'activated',
        ];


        $result = $this->startConditions()
            ->select($columns)
            ->orderBy('activated', 'asc')
            ->get()->first();
        if($result->activated === "1"){
            return false;
        }else{
//            $promo = $this
//                ->startConditions()
//                ->where('id', $result->id)
//                ->get()->first();
            $result->activated = 1;
            $result->save();





            return $result;
        }

    }

}