<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Item */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'catid')->textInput() ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_video')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'discount_price')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'num')->textInput() ?>

    <?= $form->field($model, 'business_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_barcode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'purchase_place')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'item_video')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'pc_des')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'mob_des')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'transid')->textInput() ?>

    <?= $form->field($model, 'warranty')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'online_time')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'window_reco')->textInput() ?>

    <?= $form->field($model, 'userid')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
