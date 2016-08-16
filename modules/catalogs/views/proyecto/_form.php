<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Proyecto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="proyecto-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'NombreProyecto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'HorasSolicitadas')->textInput() ?>

    <?= $form->field($model, 'Ubicacion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'FechaIni')->textInput() ?>

    <?= $form->field($model, 'FechaFin')->textInput() ?>

    <?= $form->field($model, 'IdInstitucion')->textInput() ?>

    <?= $form->field($model, 'IdEstadoProyecto')->textInput() ?>

    <?= $form->field($model, 'IdPersonaAsesor')->textInput() ?>

    <?= $form->field($model, 'NumeroPersonas')->textInput() ?>

    <?= $form->field($model, 'EstadoRegistro')->textInput(['maxlength' => true]) ?>

  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
