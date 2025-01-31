#!/usr/bin/env bash

# Ask user for input providing default values

# Usage:
# request "Message"
# request "Message" "defaultValue"

request () {
  promptMessage="$1"

  if [ "$#" -lt 2 ]
  then
    promptMessage="$1 (no default value)"
  else
    defaultInput="$2"
  fi

  read -r -p "$promptMessage [$defaultInput] ? " userinput

  if [ -z "$userinput" ]
  then
    userinput="$defaultInput"
  fi
  
  # https://stackoverflow.com/a/17336953
  # Using echo to "return valures" from the function
  echo "$userinput"
  
  # Cleanup for safe reuse
  unset defaultInput
}

