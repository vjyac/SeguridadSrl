<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Ventasmovimientoscuerpo extends Eloquent {

		protected $table = 'ventasmovimientoscuerpos';

		protected $fillable = ['ventasmovimientoscuerpos'];


	public static $errors;		

	public static function isValid($data, $rules)
		{
			
			$validation = Validator::make($data, $rules);

			if ($validation->passes()) return true;

				static::$errors = $validation->messages();

			return false;
		}


	// 	// relacion
	// public static function Ciudad()
	// 	{
	// 		return hasMany('Ciudad');
	// 	}


}