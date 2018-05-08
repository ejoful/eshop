<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SkuAttributeName;

/**
 * SkuAttributeNameSearch represents the model behind the search form of `backend\models\SkuAttributeName`.
 */
class SkuAttributeNameSearch extends SkuAttributeName
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['attr_name_id'], 'integer'],
            [['name', 'cartid'], 'safe'],
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
        $query = SkuAttributeName::find();

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
            'attr_name_id' => $this->attr_name_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'cartid', $this->cartid]);

        return $dataProvider;
    }
}
