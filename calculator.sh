#!/bin/bash

# Function to evaluate expressions using bc (arbitrary precision calculator)
calculate() {
    echo "scale=4; $1" | bc -l
}

# Main script
while true; do
    read -p "Enter expression (or 'quit' to exit): " expression

    # Check if the user wants to quit
    if [ "$expression" == "quit" ]; then
        echo "Goodbye!"
        exit 0
    fi

    # Evaluate the expression
    result=$(calculate "$expression")

    # Check if bc encountered an error
    if [ $? -ne 0 ]; then
        echo "Error: Invalid expression"
    else
        echo "Result: $result"
    fi
done

