# robthrow
A catapult for throwing robots in Gazebo

### How to use it

Bring up the catapult in an empty Gazebo world:
``` 
roslaunch robthrow_gazebo robthrow_gazebo.launch
```

Reload catapult:
``` 
rosservice call /robot_thrower/reload "{}" 
```

Throw:
``` 
rosservice call /robot_thrower/throw "{}" 
```

