extends Control

# Preload the script so we can use it.
var InputEventCustom = preload("input_event_custom.gd")

func _ready():
    # Add a callback to the `create_event` button.
    $create_event.connect("pressed", self, "on_pressed")
    
func on_pressed():
    # Create the event.
    var event = InputEventCustom.new()
