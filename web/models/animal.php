<?php
use Illuminate\Database\Eloquent\Model;
 
class Animal extends Model{
    public $timestamps = false;
    protected $table = 'animais';
    protected $fillable = ['nome','raca','chip','data_nascimento','data_atualizacao','data_falecimento','sexo','especie'];
}