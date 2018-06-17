<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemCat]].
 *
 * @see ItemCat
 */
class ItemCatQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemCat[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemCat|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
