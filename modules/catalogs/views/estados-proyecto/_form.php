<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\EstadosProyecto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="estados-proyecto-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'EstadoProyecto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'EstadoRegistro')->textInput(['maxlength' => true]) ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
