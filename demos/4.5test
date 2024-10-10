#!/bin/bash

# Define test cases as an array of tuples (input, expected_output)
test_cases=(
    "2+2,4.0"
    "5-2,3.0"
)

# Function to run a single test case
run_test() {
    local input="$1"
    local expected_output="$2"

    # Run the Python script with the input and capture the output
    output=$(python3 calc.py "$input" 2>&1)
    exit_code=$?

    # Check if the exit code is 0
    if [ $exit_code -ne 0 ]; then
        echo "Test failed: Script exited with non-zero exit code $exit_code for input '$input'"
        return 1
    fi

    # Check if the output matches the expected output
    if [ "$output" != "$expected_output" ]; then
        echo "Test failed: Output '$output' does not match expected output '$expected_output' for input '$input'"
        return 1
    fi

    return 0
}

# Run all test cases
for test_case in "${test_cases[@]}"; do
    # Split test_case into input and expected_output
    IFS=',' read -r input expected_output <<< "$test_case"
    
    if ! run_test "$input" "$expected_output"; then
        exit 1
    fi
done

echo "All tests passed"
exit 0
