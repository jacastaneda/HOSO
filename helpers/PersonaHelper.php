<?php
namespace app\helpers;
use app\modules\catalogs\models\Persona;

class PersonaHelper
{
    public static function getPersona() 
    {
        return Persona::find()->where(['UserId' => \Yii::$app->user->identity->id])->one();
    }
    
    public static function getNombrePersona() 
    {
        $p = Persona::find()->where(['UserId' => \Yii::$app->user->identity->id])->one();
        if($p === FALSE)
        {
            return 'NA';
        }
        
        return $p->NombreCompleto;
    }

    public static function getImagenPersona() 
    {
        $p = Persona::find()->where(['UserId' => \Yii::$app->user->identity->id])->one();
        if($p === FALSE)
        {
            return 'NA';
        }
        
        return $p->ArchivoAdjunto;        
    }    
        
}