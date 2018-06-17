<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modelsItemPropValueSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-prop-value-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'vid') ?>

    <?= $form->field($model, 'cid') ?>

    <?= $form->field($model, 'pid') ?>

    <?= $form->field($model, 'sid') ?>

    <?= $form->field($model, 'prop_name') ?>

    <?php // echo $form->field($model, 'name') ?>

    <?php // echo $form->field($model, 'name_alias') ?>

    <?php // echo $form->field($model, 'spell') ?>

    <?php // echo $form->field($model, 'is_parent') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'sort_order') ?>

    <?php // echo $form->field($model, 'features') ?>

    <?php // echo $form->field($model, 'modified_type') ?>

    <?php // echo $form->field($model, 'last_modified') ?>

    <?php // echo $form->field($model, 'leaf') ?>

    <?php // echo $form->field($model, 'spuid') ?>

    <?php // echo $form->field($model, 'child_pid') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
