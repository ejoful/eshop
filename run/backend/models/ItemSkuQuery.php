<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemSku]].
 *
 * @see ItemSku
 */
class ItemSkuQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemSku[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemSku|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
