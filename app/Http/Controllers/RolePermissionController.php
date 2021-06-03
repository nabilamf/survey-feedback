<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolePermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // // dd($permission);

        // $role = Role::where('name', 'Super Admin')->first();
        // $permission = Permission::find(31);
        // $role->givePermissionTo($permission->name);



        // dd(Auth()->user()->roles()->first()->getAllPermissions());

        //Add permission
        // Permission::create(['name' => 'Questionsurvey-Create']);
        // Permission::create(['name' => 'Questionsurvey-Read']);
        // Permission::create(['name' => 'Questionsurvey-Update']);
        // Permission::create(['name' => 'Questionsurvey-Delete']);
        
        // $roles = Role::where('name', '!=', 'Super Admin')->orderby('name')->get();
        //Update permission
        
        // $temp = Permission::findById(31);
        // $temp->name = 'Question-Delete';
        // $temp->save();

        // dd(Permission::findById(28));

        $roles = Role::orderby('name')->get();
        $SA = Role::where('name', 'Super Admin')->first();
        return view('roles.index', compact('roles', 'SA'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Role::create(['name' => $request->role]);
        flash('Role '.$request->role.' has been added.')->success()->important();

        return redirect()->route('roles.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        Role::find($request->id)->delete();
        flash('Role has been deleted.')->success()->important();

        return redirect()->route('role.index');
    }

    public function permission(Request $request) 
    {
        $role = Role::find($request->id);
        $role->revokePermissionTo(Permission::all());

        foreach ($request->permission as $permission) {
            if($permission != '0') {
                $p = Permission::find($permission);
                $role->givePermissionTo($p->name);
            }
        }

        return redirect()->route('roles.index');
    }
}
