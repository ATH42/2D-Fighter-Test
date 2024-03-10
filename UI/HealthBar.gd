extends ProgressBar

@onready var timer = $Timer 
@onready var db = get_node("DamageBar")

var health = 0 : set = _set_health

func _set_health(_health):
	var prev_health = health
	health = min(max_value, _health)
	if (health <= 0):
		queue_free()
	if health < prev_health:
		timer.start()
	else:
		db.value = health

func init_health(_health):
	health = _health
	max_value = health
	value = health
	db.max_value = health
	db.value = health



func _on_timer_timeout():
	db.value = health
