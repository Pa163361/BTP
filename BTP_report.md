# Estimation of system parameters using earthquake data (BTP - Project)

## Problem:

- Given the earthquake data of each sensor in three buildings at the same time
- System parameters has to be found based on the data by analyzing it

## Solution:

### 1. Converting given files into **.csv** files

- Given files are (dash) files. We converted them into `.csv` files
- While converting non-required characters, entries are removed in order to preserve only the useful information
- We implemented this for a single file but then extended it such that it can convert all files in a given folder at a time
- Used `python` language for it
- Steps to convert the files into `.csv` files:
    - open the folder in an editor
    - Enter the folder's path in the code
    - Open terminal or command prompt and enter the following command:
            
            python3 convert_it.py
    - After running the above command, you can see respective `.csv` files in the [dash] folder

### 2. Analyzing in Matlab

- We are analyzing the data using the software - **Matlab**
- The folders containing(`.csv`) files has to be uploaded into Matlab
- Download the codes from this repository
