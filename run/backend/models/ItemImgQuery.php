<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[ItemImg]].
 *
 * @see ItemImg
 */
class ItemImgQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return ItemImg[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return ItemImg|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
