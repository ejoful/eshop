<?php

namespace backend;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ItemPropValue;

/**
 * modelsItemPropValueSearch represents the model behind the search form of `backend\models\ItemPropValue`.
 */
class modelsItemPropValueSearch extends ItemPropValue
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vid', 'cid', 'pid', 'spuid', 'child_pid'], 'integer'],
            [['sid', 'prop_name', 'name', 'name_alias', 'spell', 'is_parent', 'status', 'sort_order', 'features', 'modified_type', 'last_modified', 'leaf'], 'safe'],
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
        $query = ItemPropValue::find();

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
            'vid' => $this->vid,
            'cid' => $this->cid,
            'pid' => $this->pid,
            'last_modified' => $this->last_modified,
            'spuid' => $this->spuid,
            'child_pid' => $this->child_pid,
        ]);

        $query->andFilterWhere(['like', 'sid', $this->sid])
            ->andFilterWhere(['like', 'prop_name', $this->prop_name])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'name_alias', $this->name_alias])
            ->andFilterWhere(['like', 'spell', $this->spell])
            ->andFilterWhere(['like', 'is_parent', $this->is_parent])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'sort_order', $this->sort_order])
            ->andFilterWhere(['like', 'features', $this->features])
            ->andFilterWhere(['like', 'modified_type', $this->modified_type])
            ->andFilterWhere(['like', 'leaf', $this->leaf]);

        return $dataProvider;
    }
}
