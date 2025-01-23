extends HBoxContainer


func set_text(username: String, score: int):
	$Name.text = username
	$Score.text = str(score)
	var now = Time.get_datetime_dict_from_system(true)
	var date = str(now['day'], '/', now['month'], '/', now['year'])
	var time = str(now['hour'], ':', now['minute'])
	$Date.text = date + ' ' + time
