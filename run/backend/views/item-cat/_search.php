<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemCatSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-cat-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'cid') ?>

    <?= $form->field($model, 'features') ?>

    <?= $form->field($model, 'is_parent') ?>

    <?= $form->field($model, 'spell') ?>

    <?= $form->field($model, 'name') ?>

    <?php // echo $form->field($model, 'spuid') ?>

    <?php // echo $form->field($model, 'leaf') ?>

    <?php // echo $form->field($model, 'parent_cid') ?>

    <?php // echo $form->field($model, 'sort_order') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'taosir_cat') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php // echo $form->field($model, 'modified') ?>

    <?php // echo $form->field($model, 'depth') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
