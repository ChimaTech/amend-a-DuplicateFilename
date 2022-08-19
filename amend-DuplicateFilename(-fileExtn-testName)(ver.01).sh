#! /bin/bash

# Description:
# INPUTS: (x) fileExtension
#+        (x) initial_testName

#OUTPUT: filename

#OUTPUT FORMAT: string

# HOW TO RUN example: 
#+ $ bash "thisScript.sh" "fileExtension" "initial_testName"

# Function:: to recursively check if there is a duplication of filename.
#+ compares initial_testName with existing filenames in *.fileExtension
#+ prints $initial_testName-$appendixString, if initial_testName already exist.
#+ prints $initial_testName, if initial_testName doesn't already exist
# Declaring the main function
Duplication_Amendment() {
    
    fileExtension="$1"
    
    initial_testName="$2"
    newTestName=""
    
    # Delete previous functionReport
    functionReport="functionReport.txt"
    rm -rf "${functionReport}"
    
    # Declaring the nested function
    Duplication_Amendment_subFunc() {
        
        fileExtension="$1"
        
        testName="$2" # testName will initially be == $initial_testName
                      # testName will change, if testName == $itemName_inFocus
                      # ...d/4...will be appended with "-copy" 
                      # to be assigned to a newTestName
        
        for y in *."${fileExtension}"
            do
            
                itemFullName_inFocus="${y##*/}"
                itemName_inFocus="${itemFullName_inFocus%.*}"
                
                if [[ "${2,,}" == "${itemName_inFocus,,}" ]]; then
                    #IF: $2 == $itemName_inFocus, regardless of the case. 
                    # NB: ${var,,} == all-lower-case version of $var
                    # NB: ${var^^} == all-upper-case version of $var 
                    
                    appendixString="(1)" # "(1)" | "copy"
                    
                    newTestName="${2}-${appendixString}"
                    
                    # Make this nested function call itself recursively
                    #+ if $2 == $itemName_inFocus, 
                    #+ until the $2 != $itemName_inFocus
                    Duplication_Amendment_subFunc "${1}" "${newTestName}"
                    
                fi
            
            done
            
        }
    
    # Call the Duplication_Amendment_subFunc
    #+ since calling the main Duplication_Amendment
    #+ doesn't automatically call the nested Duplication_Amendment_subFunc
    Duplication_Amendment_subFunc "$1" "$2"
    
    if [[ "${newTestName}" == "" ]]; then
        # IF: newTestName is still an empty string
        echo "${initial_testName}"
        
    else
        echo "${newTestName}"
    
    fi
    
} 

# Call the Duplication_Amendment function, now. 
Duplication_Amendment "$1" "$2"

# test