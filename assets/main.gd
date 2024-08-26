extends Node2D 
	
@export var bug_scene : PackedScene
var score 
	
func game_over ():
	$bugtimer.stop()
	$scoretimer.stop()
	$HUD.show_game_over()
	$bgmusic.stop()
	$gameoversound.play()
	
	
func new_game():
	$starttimer.start()
	$player.start_pos($startposition.position)
	score = 0 
	$HUD.update_score(score)
	$HUD.show_message("Get Ready!")
	get_tree().call_group("bugs", "queue_free")
	$bgmusic.play()
	
	
func _on_scoretimer_timeout():
	score += 1 
	$HUD.update_score(score)
	
func _on_starttimer_timeout():
	$bugtimer.start()
	$scoretimer.start()
	
	

func _on_bugtimer_timeout():
	var bug = bug_scene.instantiate()
	var bug_location = $bugpath/bugpathlocation
	bug_location.progress_ratio = randf()
	
	var direction = bug_location.rotation + PI/ 2
	bug.position = bug_location.position
	direction += randf_range (-PI/ 4,  PI/ 4)
	bug.rotation = direction 
	
	var velocity =Vector2(randf_range (150.0,250.0), 0.0 )
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)
	
	
	
	
	
	
	
	
	
	
