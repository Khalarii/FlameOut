extends Node2D

var DROPLET_SPAWN_TIME_PERIOD = 0.5
var LEAF_SPAWN_TIME_PERIOD = 2.0

onready var droplet = preload("res://Scenes/Droplet.tscn")
onready var leaf = preload("res://Scenes/Leaf.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

var droplet_time = 0
var leaf_time = 0
var idx = 0

func _process(delta):
	droplet_time += delta
	leaf_time += delta
	
	if leaf_time > LEAF_SPAWN_TIME_PERIOD:
		var leafinstance = leaf.instance()
		leafinstance.position = Vector2(rng.randi_range(128.0, 704.0), -80.0)
		leafinstance.speed += Vector2(idx, idx*2.0)
		add_child(leafinstance)
		leaf_time = 0
		
	if droplet_time > DROPLET_SPAWN_TIME_PERIOD:
		var dropletinstance = droplet.instance()
		dropletinstance.position = Vector2(rng.randi_range(-250.0, 0.0), -80.0)
		var dropletobject = dropletinstance.get_node("DropletObject")
		dropletobject.speed += Vector2(idx, idx*2.0)
		add_child(dropletinstance)
			
		dropletinstance = droplet.instance()
		dropletinstance.position = Vector2(rng.randi_range(150.0, 500.0), -80.0)
		dropletobject = dropletinstance.get_node("DropletObject")
		dropletobject.speed += Vector2(idx, idx*2.0)
		add_child(dropletinstance)
		
		dropletinstance = droplet.instance()
		dropletinstance.position = Vector2(rng.randi_range(350.0, 800.0), -80.0)
		dropletobject = dropletinstance.get_node("DropletObject")
		dropletobject.speed += Vector2(idx, idx*2.0)
		add_child(dropletinstance)
		
		dropletinstance = droplet.instance()
		dropletinstance.position = Vector2(rng.randi_range(900.0, 1100.0), -80.0)
		dropletobject = dropletinstance.get_node("DropletObject")
		dropletobject.speed += Vector2(idx, idx*2.0)
		add_child(dropletinstance)
		
		droplet_time = 0
		idx += 1
		if idx % 20 == 0:
			DROPLET_SPAWN_TIME_PERIOD *= 0.9
