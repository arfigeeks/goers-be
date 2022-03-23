<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Auth, DB;

class GoersModel extends Model
{
	use SoftDeletes;
	// Fields you do NOT want to register.
	protected $dontKeepLogOf = ['created_at', 'updated_at', 'deleted_at', 'created_by', 'updated_by', 'deleted_by'];
	// Tell what actions you want to audit.
    protected $auditableTypes = ['created', 'saved', 'deleted'];
    
	protected $hidden = ['deleted_at', 'deleted_by'];

    public $timestamps = true;
    
	public static function boot() {
		parent::boot();

		static::updating(function($table)  {
			if (Auth::user() != null) {
				$table->updated_by = Auth::user()->id;
			}
			else {
				$table->updated_by = (int) env('SYSTEM_USER_ID', '0');
			}
		});

		static::saving(function($table)  {
			if (Auth::user() != null) {
				$table->updated_by = Auth::user()->id;
			}
			else {
				$table->updated_by = (int) env('SYSTEM_USER_ID', '0');
			}
		});

		static::creating(function($table)  {
			if (Auth::user() != null) {
				if (empty($table->created_by)) $table->created_by = Auth::user()->id;
				$table->updated_by = Auth::user()->id;
			}
			else {
				if (empty($table->created_by)) $table->created_by = (int) env('SYSTEM_USER_ID', '9999');
				$table->updated_by = (int) env('SYSTEM_USER_ID', '0');
			}
		});

		static::deleting(function($table)  {
			if (Auth::user() != null) {
				$table->deleted_by = Auth::user()->id;
			}
			else {
				$table->deleted_by = (int) env('SYSTEM_USER_ID', '9999');
			}
		});
	}
}
