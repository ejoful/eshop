<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ItemProp;

/**
 * ItemPropSearch represents the model behind the search form of `backend\models\ItemProp`.
 */
class ItemPropSearch extends ItemProp
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'cid', 'material_do', 'parent_pid', 'parent_vid', 'sort_order'], 'integer'],
            [['child_template', 'features', 'is_allow_alias', 'is_color_prop', 'is_enum_prop', 'is_input_prop', 'is_item_prop', 'is_key_prop', 'is_material', 'is_sale_prop', 'is_taosir', 'modified_time', 'modified_type', 'multi', 'must', 'name', 'required', 'status', 'taosir_do', 'child_path', 'type', 'attr_keys'], 'safe'],
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
        $query = ItemProp::find();

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
            'pid' => $this->pid,
            'cid' => $this->cid,
            'material_do' => $this->material_do,
            'modified_time' => $this->modified_time,
            'parent_pid' => $this->parent_pid,
            'parent_vid' => $this->parent_vid,
            'sort_order' => $this->sort_order,
        ]);

        $query->andFilterWhere(['like', 'child_template', $this->child_template])
            ->andFilterWhere(['like', 'features', $this->features])
            ->andFilterWhere(['like', 'is_allow_alias', $this->is_allow_alias])
            ->andFilterWhere(['like', 'is_color_prop', $this->is_color_prop])
            ->andFilterWhere(['like', 'is_enum_prop', $this->is_enum_prop])
            ->andFilterWhere(['like', 'is_input_prop', $this->is_input_prop])
            ->andFilterWhere(['like', 'is_item_prop', $this->is_item_prop])
            ->andFilterWhere(['like', 'is_key_prop', $this->is_key_prop])
            ->andFilterWhere(['like', 'is_material', $this->is_material])
            ->andFilterWhere(['like', 'is_sale_prop', $this->is_sale_prop])
            ->andFilterWhere(['like', 'is_taosir', $this->is_taosir])
            ->andFilterWhere(['like', 'modified_type', $this->modified_type])
            ->andFilterWhere(['like', 'multi', $this->multi])
            ->andFilterWhere(['like', 'must', $this->must])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'required', $this->required])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'taosir_do', $this->taosir_do])
            ->andFilterWhere(['like', 'child_path', $this->child_path])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'attr_keys', $this->attr_keys]);

        return $dataProvider;
    }
}
