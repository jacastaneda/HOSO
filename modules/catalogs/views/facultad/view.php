<?php

use yii\widgets\DetailView;
use app\helpers\CrudHelper;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Facultad */
?>
<div class="facultad-view">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdFacultad',
            'Nombre',
            'Descripcion',
            'NombreCorto',
            'idUniversidad.Nombre',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
