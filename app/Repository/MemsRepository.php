<?php

namespace App\Repository;



use Illuminate\Database\Eloquent\Collection;
use App\Models\Mems as Model;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class MemsRepository extends CoreRepository
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
    public function showAllMems(){
        $columns = [
            'id',
            'author_id',
            'img',
            'text',
            'is_published',
            'dont_use',
        ];

        $result = $this->startConditions()
            ->select($columns)
            ->orderBy('id', 'asc')
            ->with(['user:id,name,avatar'])
            ->paginate(25);

        return $result;
    }

    /**
     * Меняет поле dont_use на 1
     * Означает, что мем не будет больше использоваться
     *
     * @param $id
     * @return mixed
     */
    public function MemDontUse($id){
        $mem = $this->startConditions()->find($id);

        $mem->dont_use = 1;

        $result = $mem->save();

        return $result;

    }

    /**
     * Сохранение изменённого мема
     *
     * @param $request
     * @return string
     */
    public function saveEditMem($request){
        $mem = $this->startConditions()->find($request->id);

        if(empty($mem)){
            return "Отчёт не найден";
        }

        $data = $request->all();

        $result = $mem->fill($data)->save();

        return $result;

    }

    /**
     * Изменяет статус мема на -1
     * Не опубликованный
     *
     * @param $id
     * @return mixed
     */
    public function notPublished($id){
        $mem = $this->startConditions()->find($id);

        $data = ['is_published' => '-1'];

        // Заносится в базу
        $result = $mem->fill($data)->save();

        return $result;
    }

    /**
     * Изменяет статус мема на 1
     * Опубликованный
     *
     * @param $id
     * @return mixed
     */
    public function published($id){
        $mem = $this->startConditions()->find($id);

        $data = ['is_published' => '1'];

        // Заносится в базу
        $result = $mem->fill($data)->save();

        return $result;
    }



}