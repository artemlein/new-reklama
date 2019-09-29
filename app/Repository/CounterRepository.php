<?php

namespace App\Repository;


use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Str;
use App\Models\Counter as Model1;
use App\Models\HistoryBuyChannel as Model2;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class CounterRepository extends CoreRepository
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
        return Model1::class;
    }



    /**
     * Получение всех счётчиков
     *
     * @param $id
     * @return mixed
     */
    public function getCount(){
        $result = $this->startConditions()->find(1)->get();
        return $result;
    }

    /**
     * Добавление значения в счётчик
     *
     * @param $request
     */
    public function plusMoneyCount($request){
        $result = $this->startConditions()->find(1)->get();

        $money = Str::replaceLast('р', '', $request->price);
        $money = (int)number_format($money);
        dd($money);
    }

    /**
     * Пересчитывание счётчика потраченных денег
     */
    public function refreshCountMoney(){
        $model = app(Model2::class);

        $counts = $model
            ->find(1)
            ->get();

        $count = 0;
        for ($i = 0; $i <= count($counts)-1; $i++) {
            $new_count = Str::replaceLast('р', '', $counts[$i]->price);
            $count = $count + (int)$new_count;
        }


        $count_money = $this->startConditions()->find(1)->get();
        $count = $count / 1000;

        $count_money[0]->money = round($count, 2);


    }


    public function Update($id, $request){
        $report = $this->startConditions()->find($id);

        if(empty($reports)){
            return false;
        }

        $data = $request->all();

        $result = $report->fill($data)->save();

        return $result;
    }
    /**
     * Получить список отчётов для вывода в списке
     *
     *
     * @return LengthAwarePaginator
     */
    public function getForShow($id){
        $result = $this->startConditions1()->with(['reason:id,title'])->find($id);


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
            'url_channel',
            'name_vk',
            'url_vk',
            'description',
            'subscribe',
            'price',
            'view',
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