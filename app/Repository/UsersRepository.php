<?php

namespace App\Repository;



use Illuminate\Database\Eloquent\Collection;
use App\Models\User as Model;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class UsersRepository extends CoreRepository
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
     * Получить список пользователей
     * (Админка)
     *
     * @return LengthAwarePaginator
     */
    public function getAllUsers(){
        $result = $this
            ->startConditions()
            ->orderBy('id', 'DESC')
            ->paginate(25);

        return $result;
    }

    /**
     * Получение пользователя для редактирования
     *
     * @param App\Http\Controllers\Admin\UsersController $id
     */
    public function EditAccessModerate($id, $value){
        $result = $this
            ->startConditions()
            ->find($id);

        if($value === "true"){
            $result->access_moderation = 0;
            $result->save();

            return true;
        } else {
            $result->access_moderation = 1;
            $result->save();

            return false;
        }
    }

    /**
     * Смена доступа для админов
     *
     * @boolean $value
     * @param $id
     */
    public function EditAccessAdmin($id, $value)
    {
        $result = $this
            ->startConditions()
            ->find($id);

        if ($value === "true") {
            $result->access_admin = 0;
            $result->save();

            return true;
        } else {
            $result->access_admin = 1;
            $result->save();

            return false;
        }
    }

    /**
     * Смена доступа для мемоделов
     *
     * @boolean $value
     * @param $id
     */
        public function EditAccessMems($id, $value){
            $result = $this
                ->startConditions()
                ->find($id);

            if($value === "true"){
                $result->access_mems = 0;
                $result->save();

                return true;
            } else {
                $result->access_mems = 1;
                $result->save();

                return false;
            }
    }

    /**
     * Изменение счётчика по принятым постам +1
     *
     * @param $id
     * @return mixed
     */
    public function acceptPublicPost($id){
        $user = $this->startConditions()->find($id);

        $user->accept_post = $user->accept_post + 1;

        $result = $user->save();

        return $result;

    }

    /**
     * Изменение счётчика по принятым постам -1
     *
     * @param $id
     * @return mixed
     */
    public function declinePublicPost($id){
        $user = $this->startConditions()->find($id);

        $user->accept_post = $user->access_post - 1;

        $result = $user->save();

        return $result;

    }

    /**
     * Изменение счётчика по отклонённым постам +1
     *
     * @param $id
     * @return mixed
     */
    public function acceptBadPost($id){
        $user = $this->startConditions()->find($id);

        $user->decline_post = $user->decline_post + 1;

        $result = $user->save();

        return $result;

    }

    /**
     * Изменение счётчика по отклонённым постам -1
     *
     * @param $id
     * @return mixed
     */
    public function declineBadPost($id){
        $user = $this->startConditions()->find($id);

        $user->decline_post = $user->decline_post - 1;

        $result = $user->save();

        return $result;

    }

    /**
     * Отнимает 10 принятых мемов
     * для получение промокода
     *
     * @param $id
     * @return mixed
     */
    public function minusBalanceForPromo($id){
        $user = $this->startConditions()->find($id);

        $user->accept_post = $user->accept_post - 10;

        $result = $user->save();

        return $result;

    }

    /**
     * Прибовляет к счётчику всех мемов +1
     *
     * @param $id
     * @return mixed
     */
    public function plusAllPostCounter($id){
        $user = $this->startConditions()->find($id);

        $user->all_post = $user->all_post + 1;

        $result = $user->save();

        return $result;
    }

    /**
     * Прибавляет к счётчику полученных промокодов +1
     *
     * @param $id
     * @return mixed
     */
    public function plusAllPromocodeCounter($id){
        $user = $this->startConditions()->find($id);

        $user->use_promo = $user->use_promo + 1;

        $result = $user->save();

        return $result;
    }

    /**
     * Получает профиль мемодела по его id
     *
     * @param $id
     * @return mixed
     */
    public function getProfileUser($id){
        $columns = [
            'id',
            'user_id',
            'name',
            'avatar',
            'accept_post',
            'decline_post',
            'all_post',
            'use_promo',
        ];

        $result = $this->startConditions()
            ->select($columns)
            ->where('user_id',$id)
            ->get()->first();
        return $result;
    }

}