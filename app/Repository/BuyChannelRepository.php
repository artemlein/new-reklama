<?php

namespace App\Repository;

use Illuminate\Database\Eloquent\Collection;
use App\Models\BuyChannel as Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Str;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class BuyChannelRepository extends CoreRepository
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
    public function addChannel($request){
        $data = [];


//        dd($result_url_vk["response"][0]["first_name"]." ".$result_url_vk["response"][0]["last_name"],$result_url_yt["items"][0]["snippet"]["title"],$result_url_yt["items"][0]["statistics"]["subscriberCount"],$request->url_channel);


        $data["name_channel"] = $request->name_channel;
        $data["url_channel"] = $request->url_channel;
        $data["url_vk"] = $request->url_vk;
        $data["name_vk"] = $request->name_vk;
        $data["status"] = 0;

        $result = $this->startConditions()->fill($data)->save();

        return $result;
    }
    public function getCountBuyChannels(){

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
    public function getChannelOnId($id){
        $result = $this->startConditions()->find($id);


        return $result;
    }

    public function DeleteChannel($channel){

        $channel->delete();
        return true;
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
            'id',
            'name_channel',
            'url_channel',
            'name_vk',
            'url_vk',
            'description',
            'subscribe',
            'price',
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

    public function DestroyReport($id){
        $report = $this
            ->startConditions()
            ->find($id);

        $report->delete();

        return true;
    }
}