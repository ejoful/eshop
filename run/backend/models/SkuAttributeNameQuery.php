<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[SkuAttributeName]].
 *
 * @see SkuAttributeName
 */
class SkuAttributeNameQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return SkuAttributeName[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return SkuAttributeName|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
