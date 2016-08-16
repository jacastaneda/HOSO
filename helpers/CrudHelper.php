<?php
namespace app\helpers;
class CrudHelper
{
    const ACTIVE = '1';
    const INACTIVE = '0';     
    public static function getEstadosRegistro() 
    {
        return array (self::ACTIVE=>'Activo',self::INACTIVE=>'Inactivo');
    }
     
    public static function getEstadosRegistroLabel($estadoRegistro) {
      if ($estadoRegistro==self::ACTIVE) {
        return 'Activo';
      } else {
        return 'Inactivo';        
      }
    } 
}