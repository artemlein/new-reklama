<?php

namespace App\Repository;


use Illuminate\Database\Eloquent\Collection;
use App\Models\Reason as Model;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 *  Class BlogCategoryRepository
 *
 * @package App\Repository
 */
class ReasonRepository extends CoreRepository
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
     * Получить список статей для вывода в списке
     * (Админка)
     *
     * @return LengthAwarePaginator
     */
    public function getReasonForReportEdit()
    {
        // CONCAT Соединение 2 строк id + "." + title = id_title
        $columns = implode(',', [
            'id',
            'CONCAT (id, ".", title) AS id_title',
        ]);

        $result = $this
            ->startConditions()
            ->selectRaw($columns)
            ->toBase()
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
     * Получение из базы для просмотра всех причин
     *
     * @return App\Http\Controllers\Admin\ReasonController
     */
    public function getReasonForShowAdmin()
    {

        $result = $this
            ->startConditions()
            ->orderBy('id', 'DESC')
            ->paginate(25);

        return $result;
    }

    /**
     * Возвращает причину для редактирования
     *
     * @param $id
     *
     * @return App\Http\Controllers\Admin\ReasonController
     */
    public function getReasonForEditAdmin($id){
        $result = $this
            ->startConditions()
            ->find($id);

        return $result;
    }

    /**
     * Удаление причины
     *
     * @param $id
     */
    public function DestroyReason($id){
        $reason = $this
            ->startConditions()
            ->find($id);

        $reason->delete();

        return true;
    }
}