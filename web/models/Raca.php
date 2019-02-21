<?php
use Illuminate\Database\Eloquent\Model;
 
class Raca extends Model{
    public $timestamps = false;
    protected $table = 'racas';
    protected $fillable = ['nome','situacao'];


    public function animal()
    {
        return $this->hasMany('Animal', 'raca_id', 'id');
    }

}