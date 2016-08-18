<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Persona */
?>
<div class="persona-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdPersona',
            'Nombres',
            'Apellidos',
            'CarnetEstudiante',
            'CarnetEmpleado',
            'DUI',
            'NIT',
            'Direccion',
            'Telefono',
            'Sexo',
            'Cargo',
            'UserId',
            'TipoPersona',
            'ArchivoAdjunto',
            'NombreAdjunto',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
