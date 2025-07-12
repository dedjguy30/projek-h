extends Node2D

var kartu_digeser

func _process(delta: float) -> void:
	if kartu_digeser:
		var posisi_mouse = get_local_mouse_position()
		kartu_digeser.position = posisi_mouse
		print(posisi_mouse)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var kartu = Check_Kartu()
			if kartu:
				kartu_digeser = kartu
		else:
			kartu_digeser = null

func Check_Kartu():
	var status_letak = get_world_2d().direct_space_state
	var parameter = PhysicsPointQueryParameters2D.new()
	parameter.position = get_global_mouse_position()
	parameter.collide_with_areas = true
	parameter.collision_mask = 1
	var hasil = status_letak.intersect_point(parameter)
	if hasil.size() > 0:
		return hasil[0].collider.get_parent()
	else:
		return null
