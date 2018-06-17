<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[CategoryGroupStatus]].
 *
 * @see CategoryGroupStatus
 */
class CategoryGroupStatusQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return CategoryGroupStatus[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return CategoryGroupStatus|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
