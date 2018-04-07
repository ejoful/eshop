<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemColor]].
 *
 * @see ItemColor
 */
class ItemColorQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemColor[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemColor|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
