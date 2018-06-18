<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[Sku]].
 *
 * @see Sku
 */
class SkuQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Sku[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Sku|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
