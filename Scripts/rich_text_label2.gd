extends RichTextLabel

# An array to hold your different lines of text
var dialogue_lines = [
 "Ooooo you are back !!",
 "You got the treasure ",
"i told you about",
 "Now i have something bigger ",
 "but beware of those octopuses ",
"the big ones can kill you in one sting ",
" You can revive your health by using regenaration booth but those are hidden "
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
  visible=false
  # What happens when the text ends
  print("End of dialogue reached.")
  # hide() or load_next_level() could go here

func update_display():
 # Use .text in Godot 4.x or .bbcode_text in Godot 3.x
 text = dialogue_lines[current_line_index]
