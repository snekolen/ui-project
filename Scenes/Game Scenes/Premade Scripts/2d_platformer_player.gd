extends CharacterBody2D
class_name Player

signal coin_collected(current_amount: int)
signal hp_changed(current_hp: int)

const SPEED: float = 400.0
const JUMP_VELOCITY: float = -700.0
const MAX_HP: int = 100
const HURT_ANIMATION_LENGTH: float = 0.5

var coins: int = 0 :
	set(value):
		coins = value
		coin_collected.emit(coins)

var hp: int :
	set(value):
		if value < hp:
			_play_hurt_animation()
		hp = value
		hp_changed.emit(hp)

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	hp = MAX_HP

func _physics_process(delta: float) -> void:
	_handle_movement(delta)
	_handle_animations()
	
	move_and_slide()
	
	_handle_spikes()

func _handle_movement(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * 1.5 * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y > 1500:
		get_tree().reload_current_scene()
		return

func _handle_animations() -> void:
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		if velocity.y > 0:
			animated_sprite.play("fall")
		else:
			animated_sprite.play("jump")
	
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true

func _handle_spikes() -> void:
	var last_collision: KinematicCollision2D = get_last_slide_collision()
	
	if not last_collision:
		return
	
	if last_collision.get_collider().is_in_group("spikes") and $DamageTimer.is_stopped():
		$DamageTimer.start()
		hp -= 20

func _play_hurt_animation() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, HURT_ANIMATION_LENGTH).from(Color.RED)
