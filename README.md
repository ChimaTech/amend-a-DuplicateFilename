# Amend a Duplicate Filename.

### Inputs : 
- fileExtension *(string, 1st argument)*
- initial_testName *(string, 2nd argument)*

### Output: 
- filename *(string)*

### Output Format: 
- string

### Description. 
The shell script `amend-DuplicateFilename(-fileExtn-testName)(ver.01).sh` recursively checks if there is a duplication of filename and prints an appropriate filename. 

It compares the **initial_testName** with existing filenames for each file with the file extension **fileExtension**. 

 It then prints:
 - `$initial_testName-$appendixString`, if **initial_testName** already exist, or
 - `$initial_testName`, if **initial_testName** doesn't already exist. 

### HOW TO RUN. 
Example: 
```sh
bash "amend-DuplicateFilename(-fileExtn-testName)(ver.01).sh" "mp3" "Obi"
```
