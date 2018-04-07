<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Order;

/**
 * OrderSearch represents the model behind the search form of `backend\models\Order`.
 */
class OrderSearch extends Order
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['orderid', 'quantity', 'shipping_address', 'note', 'zip_code', 'shipping_id', 'shipping_time', 'pay_time', 'alipay_number', 'pay_status', 'close_type', 'close_time', 'cloase_reason'], 'safe'],
            [['userid', 'itemid', 'skuid', 'couponid'], 'integer'],
            [['pay_amount'], 'number'],
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
        $query = Order::find();

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
            'userid' => $this->userid,
            'itemid' => $this->itemid,
            'skuid' => $this->skuid,
            'couponid' => $this->couponid,
            'pay_amount' => $this->pay_amount,
            'shipping_time' => $this->shipping_time,
            'pay_time' => $this->pay_time,
            'close_time' => $this->close_time,
        ]);

        $query->andFilterWhere(['like', 'orderid', $this->orderid])
            ->andFilterWhere(['like', 'quantity', $this->quantity])
            ->andFilterWhere(['like', 'shipping_address', $this->shipping_address])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'zip_code', $this->zip_code])
            ->andFilterWhere(['like', 'shipping_id', $this->shipping_id])
            ->andFilterWhere(['like', 'alipay_number', $this->alipay_number])
            ->andFilterWhere(['like', 'pay_status', $this->pay_status])
            ->andFilterWhere(['like', 'close_type', $this->close_type])
            ->andFilterWhere(['like', 'cloase_reason', $this->cloase_reason]);

        return $dataProvider;
    }
}
