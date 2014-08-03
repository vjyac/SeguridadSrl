<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class CondicionesVenta extends Eloquent {

		protected $table = 'condicionesventas';

		protected $fillable = ['condicionesventa'];

	public static $errors;		

	public static function isValid($data, $rules)
		{
			
			$validation = Validator::make($data, $rules);

			if ($validation->passes()) return true;

				static::$errors = $validation->messages();

			return false;
		}


}