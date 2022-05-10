uint8 MODE_TWIST = 0
uint8 MODE_DISTINCT = 1

# Set the command mode
uint8 mode

# Twist mode: one twist for the whole rover
geometry_msgs/Twist twist

# Distinct joystick commands for each side
float32 left
float32 right
