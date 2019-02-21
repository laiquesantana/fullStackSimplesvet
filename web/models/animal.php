<?php
use Illuminate\Database\Eloquent\Model;
 
class Animal extends Model{
    public $timestamps = false;
    protected $table = 'animais';
    protected $fillable = ['nome','raca_id','chip','data_nascimento','data_atualizacao','data_falecimento','sexo','especie'];


    public function raca()
    {
        return $this->hasOne('Raca','id','raca_id');
    }
}