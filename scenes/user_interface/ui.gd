extends CanvasLayer

func _ready() -> void:
	Globals.connect('score_changed', on_score_changed)

func on_score_changed():
	$Score.text = str(Globals.score)
