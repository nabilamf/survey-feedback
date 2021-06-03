<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
	/**
	 * Display a listing of the users
	 *
	 * @param  \App\User  $model
	 * @return \Illuminate\View\View
	 */
	public function index(User $model)
	{
		$users = User::orderby('name')->get();
		return view('users.index', compact('users'));
	}

	/**
	 * Show the form for creating a new user
	 *
	 * @return \Illuminate\View\View
	 */
	public function create()
	{
		$roles = Role::orderby('name')->get();
		return view('users.create', compact('roles'));
	}

	/**
	 * Store a newly created user in storage
	 *
	 * @param  \App\Http\Requests\UserRequest  $request
	 * @param  \App\User  $model
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{
		$request->validate([
			'name' => array('required', 'regex:/^[a-z ,.\'-]+$/i'),
			'email' => 'required|email|unique:users,email',
			'password' => 'required|string|min:8|confirmed',
			'gender' => 'required',
			'phone' => 'required|digits_between:10,11',
			// 'company' => 'required',
			'role' => 'required'
		]);

		$user = new User;
		$user->name = $request->name;
		$user->email = $request->email;
		$user->password = Hash::make($request->password);
		$user->gender = $request->gender;
		$user->phone = $request->phone;
		$user->save();

		$user->assignRole($request->role);

		return redirect()->route('user.index')->withStatus(__('User successfully created.'));
	}

	/**
	 * Show the form for editing the specified user
	 *
	 * @param  \App\User  $user
	 * @return \Illuminate\View\View
	 */
	public function edit(User $user)
	{
		$roles = Role::orderby('name')->get();
		return view('users.edit', compact('user', 'roles'));
	}

	public function setActive($id)
	{
		$user = User::find($id);
		if($user->active == 0)
			$user->active = 1;
		else
			$user->active = 0;

		$user->save();

		$data = ['berjaya'];

		echo json_encode($data);
	}

	public function update(Request $request, User  $user)
	{
		$request->validate([
			'name' => array('required', 'regex:/^[a-z ,.\'-]+$/i'),
			'email' => 'required|email|unique:users,email,'.$user->id,
			'password' => 'required|string|min:8|confirmed',
			'gender' => 'required',
			'phone' => 'required|digits_between:10,11',
			// 'company' => 'required',
			'role' => 'required'
		]);

		$user->update(
			$request->merge(['password' => Hash::make($request->get('password'))])
				->except([$request->get('password') ? '' : 'password']
		));

		$roles = Role::all();
		foreach ($roles as $role) {
			$user->removeRole($role);
		}
		$user->assignRole($request->role);

		return redirect()->route('user.index')->withStatus(__('User successfully updated.'));
	}

	/**
	 * Remove the specified user from storage
	 *
	 * @param  \App\User  $user
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function destroy(User  $user)
	{
		$user->delete();

		return redirect()->route('user.index')->withStatus(__('User successfully deleted.'));
	}
}
