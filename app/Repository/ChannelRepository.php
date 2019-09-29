<?php

namespace App\Repository;

use Illuminate\Database\Eloquent\Collection;
use App\Models\Channel as Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Str;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class ChannelRepository extends CoreRepository
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

        $url_channel = Str::after($request->url_channel, 'https://www.youtube.com/channel/');
        $result_url_yt = json_decode(file_get_contents('https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&key=AIzaSyA_hC2Tlj6OZTpdXgEYpimMUKQRXTs5NpM&id='.$url_channel), TRUE);
        $vk_id = Str::after($request->url_vk, 'https://vk.com/');
        $result_url_vk = json_decode(file_get_contents("https://api.vk.com/method/users.get?user_ids=".$vk_id."&access_token=0fe3da34f1a367e8a796afad6a57cff4fe123bcd57925d64d08be2f93ee77ff54d502cbfca75937ab337a&v=5.89"), TRUE);

//        dd($result_url_vk["response"][0]["first_name"]." ".$result_url_vk["response"][0]["last_name"],$result_url_yt["items"][0]["snippet"]["title"],$result_url_yt["items"][0]["statistics"]["subscriberCount"],$request->url_channel);


        $data["name_channel"] = $result_url_yt["items"][0]["snippet"]["title"];
        $data["subscribe"] = (int)$result_url_yt["items"][0]["statistics"]["subscriberCount"] / 1000;
        $data["url_vk"] = $request->url_vk;
        $data["name_vk"] = $result_url_vk["response"][0]["first_name"]." ".$result_url_vk["response"][0]["last_name"];
        $data["url_channel"] = $request->url_channel;
        $data["description"] = $request->description;
        $data["price"] = 0;

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