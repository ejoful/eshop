<?php

namespace backend\models;

/**
 * This is the ActiveQuery class for [[CategoryAttribute]].
 *
 * @see CategoryAttribute
 */
class CategoryAttributeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return CategoryAttribute[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return CategoryAttribute|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
