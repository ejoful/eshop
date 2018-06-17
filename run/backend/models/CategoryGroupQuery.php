<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[CategoryGroup]].
 *
 * @see CategoryGroup
 */
class CategoryGroupQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return CategoryGroup[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return CategoryGroup|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
