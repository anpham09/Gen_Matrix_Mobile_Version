extends Node


@onready var video_stream_player_3: VideoStreamPlayer = $"../Player/VideoStreamPlayer3"


var score = 0

func add_point():
	score += 1
	print(score)



func _on_video_stream_player_3_finished() -> void:
	video_stream_player_3.queue_free()
