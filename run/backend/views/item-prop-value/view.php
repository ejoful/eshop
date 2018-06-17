<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemPropValue */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Prop Values'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-prop-value-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'vid' => $model->vid, 'cid' => $model->cid, 'pid' => $model->pid], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'vid' => $model->vid, 'cid' => $model->cid, 'pid' => $model->pid], [
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
            'vid',
            'cid',
            'pid',
            'sid',
            'prop_name',
            'name',
            'name_alias',
            'spell',
            'is_parent',
            'status',
            'sort_order',
            'features',
            'modified_type',
            'last_modified',
            'leaf',
            'spuid',
            'child_pid',
        ],
    ]) ?>

</div>
