class_name FinalScreen
extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialog: Dialog = $Dialog/Dialog


func _ready() -> void:
	set_process_input(false)


func play_scene() -> void:
	animation_player.play("intro")
	camera_2d.make_current()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action-confirm"):
		GameUI.next_dialog_line()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"intro":
			GameUI.request_dialog(dialog)
			set_process_input(true)
			GameUI.next_dialog_line()


func _on_dialog_ui_dialog_ended() -> void:
	animation_player.play("eating")


func _on_dialog_ui_new_line_started(_line_index: Variant) -> void:
	animation_player.play("talk")
