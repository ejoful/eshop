<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemProp */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Props'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-prop-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->pid], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->pid], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'pid',
            'child_template',
            'cid',
            'features',
            'is_allow_alias',
            'is_color_prop',
            'is_enum_prop',
            'is_input_prop',
            'is_item_prop',
            'is_key_prop',
            'is_material',
            'is_sale_prop',
            'is_taosir',
            'material_do',
            'modified_time',
            'modified_type',
            'multi',
            'must',
            'name',
            'parent_pid',
            'parent_vid',
            'required',
            'sort_order',
            'status',
            'taosir_do',
            'child_path',
            'type',
            'attr_keys',
        ],
    ]) ?>

</div>
