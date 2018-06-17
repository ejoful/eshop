<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ItemCat;

/**
 * ItemCatSearch represents the model behind the search form of `backend\models\ItemCat`.
 */
class ItemCatSearch extends ItemCat
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid', 'spuid', 'parent_cid'], 'integer'],
            [['features', 'is_parent', 'spell', 'name', 'leaf', 'sort_order', 'status', 'taosir_cat', 'created', 'modified', 'depth'], 'safe'],
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
        $query = ItemCat::find();

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
            'cid' => $this->cid,
            'spuid' => $this->spuid,
            'parent_cid' => $this->parent_cid,
            'created' => $this->created,
            'modified' => $this->modified,
        ]);

        $query->andFilterWhere(['like', 'features', $this->features])
            ->andFilterWhere(['like', 'is_parent', $this->is_parent])
            ->andFilterWhere(['like', 'spell', $this->spell])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'leaf', $this->leaf])
            ->andFilterWhere(['like', 'sort_order', $this->sort_order])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'taosir_cat', $this->taosir_cat])
            ->andFilterWhere(['like', 'depth', $this->depth]);

        return $dataProvider;
    }
}
