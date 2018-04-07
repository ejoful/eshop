<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ItemSku;

/**
 * ItemSkuSearch represents the model behind the search form of `backend\models\ItemSku`.
 */
class ItemSkuSearch extends ItemSku
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['skuId', 'itemid', 'colorid', 'packageid', 'num'], 'integer'],
            [['price'], 'number'],
            [['business_code', 'product_barcode'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ItemSku::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'skuId' => $this->skuId,
            'itemid' => $this->itemid,
            'colorid' => $this->colorid,
            'packageid' => $this->packageid,
            'price' => $this->price,
            'num' => $this->num,
        ]);

        $query->andFilterWhere(['like', 'business_code', $this->business_code])
            ->andFilterWhere(['like', 'product_barcode', $this->product_barcode]);

        return $dataProvider;
    }
}
