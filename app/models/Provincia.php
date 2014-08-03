<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class Provincia extends Eloquent {

		protected $table = 'provincias';

		protected $fillable = ['provincia'];

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


		// relacion
	public static function Ciudad()
		{
			return hasMany('Ciudad');
		}


}