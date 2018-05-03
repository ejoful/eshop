<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemSize]].
 *
 * @see ItemSize
 */
class ItemSizeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemSize[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemSize|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
