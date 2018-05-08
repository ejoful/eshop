<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Item;

/**
 * ItemSearch represents the model behind the search form of `backend\models\Item`.
 */
class ItemSearch extends Item
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['itemid', 'catid', 'num', 'transid', 'userid'], 'integer'],
            [['type', 'title', 'img_video', 'business_code', 'product_barcode', 'purchase_place', 'item_video', 'pc_des', 'mob_des', 'warranty', 'online_time', 'window_reco'], 'safe'],
            [['price', 'discount_price'], 'number'],
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
        $query = Item::find();

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
            'itemid' => $this->itemid,
            'catid' => $this->catid,
            'price' => $this->price,
            'discount_price' => $this->discount_price,
            'num' => $this->num,
            'transid' => $this->transid,
            'userid' => $this->userid,
        ]);

        $query->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'img_video', $this->img_video])
            ->andFilterWhere(['like', 'business_code', $this->business_code])
            ->andFilterWhere(['like', 'product_barcode', $this->product_barcode])
            ->andFilterWhere(['like', 'purchase_place', $this->purchase_place])
            ->andFilterWhere(['like', 'item_video', $this->item_video])
            ->andFilterWhere(['like', 'pc_des', $this->pc_des])
            ->andFilterWhere(['like', 'mob_des', $this->mob_des])
            ->andFilterWhere(['like', 'warranty', $this->warranty])
            ->andFilterWhere(['like', 'online_time', $this->online_time])
            ->andFilterWhere(['like', 'window_reco', $this->window_reco]);

        return $dataProvider;
    }
}
