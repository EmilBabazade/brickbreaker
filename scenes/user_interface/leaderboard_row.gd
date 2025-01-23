extends HBoxContainer


func set_text(username: String, score: int, datetime: Dictionary):
	$Name.text = username
	$Score.text = str(score)
	var date = str(datetime['day'], '/', datetime['month'], '/', datetime['year'])
	var time = str(datetime['hour'], ':', datetime['minute'])
	$Date.text = date + ' ' + time
