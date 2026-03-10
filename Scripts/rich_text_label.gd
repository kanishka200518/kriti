extends RichTextLabel

# An array to hold your different lines of text
var dialogue_lines = [
 "Hello i am your friend , follow me   
press enter",
 "I will take you to your destination  
 press enter",
 "Remember: some things are seen, and some are unseen.
press enter",
"Where there seems no way maybe it is hidden ",
 "But our lives are tied if i die you die",
"I will protect you just press Q i will attack the enemies",
"Press E to attack yourself"
]

var current_line_index = 0

func _ready():
 # Display the first line immediately
 update_display()

func _input(event):
 # Check if the player pressed the "Enter" key
 if event.is_action_pressed("ui_accept"):
  advance_text()

func advance_text():
 current_line_index += 1
 
 if current_line_index < dialogue_lines.size():
  update_display()
 else:
  # What happens when the text ends
  print("End of dialogue reached.")
  visible=false
  # hide() or load_next_level() could go here

func update_display():
 # Use .text in Godot 4.x or .bbcode_text in Godot 3.x
 text = dialogue_lines[current_line_index]
