extends Node3D

@onready var salaryTimer: Timer = $SalaryTimer
@onready var progress: ProgressBar = $Camera3D/ProgressBar
@onready var moneyLabel: Label = $Camera3D/Money
@onready var hatPoint: Node3D = $Player/Character/Hat

var balance = 0
var salaryTime = 10
var percent = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	moneyLabel.text = str(balance)
	salaryTimer.wait_time = salaryTime
	salaryTimer.timeout.connect(_onSalaryTimer)
	progress.min_value = 0
	progress.max_value = salaryTime
	salaryTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress.value = salaryTime - salaryTimer.time_left

func _onSalaryTimer():
	appendBalance(10)
	
func appendBalance(value: int):
	balance += value
	moneyLabel.text = str(balance)


var hats = [null, "res://models/torus_hat_mesh.tres", "res://models/prism_hat_mesh.tres"]

func _on_shop_button_pressed() -> void:
	if balance >= 10:
		var rng = RandomNumberGenerator.new()
		var index = rng.randi_range(0, 2)
		var hat = hats[index]
		var currentHat = hatPoint.get_child(0)
		appendBalance(-10)
		if hat:
			var hatMesh = MeshInstance3D.new()
			var imported_resource = load(hat)
			hatMesh.mesh = imported_resource
			if currentHat:
				hatPoint.remove_child(currentHat)
			hatPoint.add_child(hatMesh)
		else:
			hatPoint.remove_child(currentHat)
