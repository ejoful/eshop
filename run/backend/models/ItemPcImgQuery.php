<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemPcImg]].
 *
 * @see ItemPcImg
 */
class ItemPcImgQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemPcImg[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemPcImg|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
