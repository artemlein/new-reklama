<?php

namespace App\Repository;

use Illuminate\Database\Eloquent\Collection;
use App\Models\HistoryBuyChannel as Model;
use App\Models\Counter;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class HistoryBuyChannelRepository extends CoreRepository
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
     * Получить отчёт для редактирования
     *
     * @param $id
     * @return mixed
     */

    public function Update($id, $request){
        $report = $this->startConditions()->find($id);

        if(empty($reports)){
            return false;
        }

        $data = $request->all();

        $result = $report->fill($data)->save();

        return $result;
    }

    public function store($request){
        $buyChannel = (new Model())->fill($request->input());
        $buyChannel->save();



    }

    /**
     * Получить список отчётов для вывода в списке
     *
     *
     * @return LengthAwarePaginator
     */
    public function getForShow($id){
        $result = $this->startConditions()->with(['reason:id,title'])->find($id);


        return $result;
    }

    /**
     * Получить список отчётов для вывода в списке
     *
     *
     * @return LengthAwarePaginator
     */
    public function getAllWithPaginate()
    {
        $columns = [
            'name_channel',
            'price',
            'date_publication',
            'url_video',
            'wallet',
            'status',
        ];

        $result = $this->startConditions()
            ->select($columns)
            ->get();

        /*//Отношение возникает только при его вызове
        $post = $result->first();

        $userId = $post->user->id;
        dd($post,$userId);
        $post->category->id;
        dd($result->first());*/
        return $result;
    }

    /**
     * Передаётся id пользователя для поиска
     *
     * @param $id
     */
    public function getReportForSearch($muted_url){

        $columns = [
            'id',
            'muted_url',
            'reason',
            'moderate',
        ];
        $result = $this->startConditions()->with(['reason:id,title'])->where('muted_url', '=', $muted_url)
            ->get();

        return $result;
    }

    /**
     * Удаляет отчёт
     *
     * @param $id
     */
    public function DestroyReport($id){
        $report = $this
            ->startConditions()
            ->find($id);

        $report->delete();

        return true;
    }
}