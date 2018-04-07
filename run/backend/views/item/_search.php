<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'itemid') ?>

    <?= $form->field($model, 'catid') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'img_video') ?>

    <?php // echo $form->field($model, 'price') ?>

    <?php // echo $form->field($model, 'discount_price') ?>

    <?php // echo $form->field($model, 'num') ?>

    <?php // echo $form->field($model, 'business_code') ?>

    <?php // echo $form->field($model, 'product_barcode') ?>

    <?php // echo $form->field($model, 'purchase_place') ?>

    <?php // echo $form->field($model, 'item_video') ?>

    <?php // echo $form->field($model, 'pc_des') ?>

    <?php // echo $form->field($model, 'mob_des') ?>

    <?php // echo $form->field($model, 'transid') ?>

    <?php // echo $form->field($model, 'warranty') ?>

    <?php // echo $form->field($model, 'online_time') ?>

    <?php // echo $form->field($model, 'window_reco') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
