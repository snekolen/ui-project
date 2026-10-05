extends CanvasLayer

@onready var player: Player = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	%CoinCounterLabel.text = "0"
	%PlayerHPBar.value = player.hp
	player.coin_collected.connect(_on_coin_collected)
	player.hp_changed.connect(_on_hp_changed)

func _on_coin_collected(current_coins: int):
	%CoinCounterLabel.text = str(current_coins)
	
func _on_hp_changed(current_hp: int):
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(%PlayerHPBar, "value", current_hp, 0.4)
