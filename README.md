# rover_udes

Contains the main documentation for Rovus.
Here lives:
 - Custom messages
 - Custom services
 - Main launch files
 - Documentation

## Git repositories

### `rover_control`
Contains the code required to control the rover at a higher level or for the simulation.
### `rover_drivers`
Contains the code required for the rover to interact with its hardware, like Arduino code.
### `rover_arm`
Contains the code required to control the rover arm.
### `rover_base`
Contains the code that is specific to the base station, like GUI code.
### `rover_antenna`
Contains the code that runs on the antenna station.
### `ros_talon`
RobotiqueUdeS' fork of a third-party ros library used to control the Talon SRX drives

## Launch files

### base.launch
Launch file for nodes that run on base station

### rover.launch
Launch file for nodes that run on rover

## Jetson's infos
Name: RobotiqueUdeS
>
Hostname: rover
>
Username: rover
>
Password: roverudes
