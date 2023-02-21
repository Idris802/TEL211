#!/bin/bash

# Clone the Github repository
git clone https://github.com/NMBURobotics/bash_basic_examples.git

# Navigate to the script directory
cd bash_basic_examples/scripts

# Loop through all script files with a ".sh" extension and run them
for script in *.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "Running script: $script"
        ./"$script"
        echo "Script finished: $script"
    fi
done

