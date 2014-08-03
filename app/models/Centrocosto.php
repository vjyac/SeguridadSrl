<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Centrocosto extends Eloquent {

		protected $table = 'centrocostos';

		protected $fillable = ['centrocosto'];

	// public static $rules = [

	// 	'provincia' => 'required|unique:provincias,' . $id
	// 	];


	public static $errors;		

	public static function isValid($data, $rules)
		{
			
			$validation = Validator::make($data, $rules);

			if ($validation->passes()) return true;

				static::$errors = $validation->messages();

			return false;
		}




}