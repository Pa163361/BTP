# Estimation of system parameters using earthquake data (BTP - Project)

## Problem

- Given the earthquake data of each sensor in three buildings at the same time
- System parameters has to be found based on the data by analyzing it

## Solution

### 1. Converting given files into **.csv** files

- Given files are normal text files. We convert them into `.csv` files
- While converting, non-required characters, entries are removed in order to preserve only the useful information
- We implemented this for a single file but then extended it such that it can convert all files in a given folder at a time
- Used `C++` language for it
- Steps to convert the files into `.csv` files:
  - Enter the all files' paths of a folder in a text file - **paths.txt**
  - open the `script.cpp` in an editor
  - Enter the **paths.txt** file's path in the code
  - Open terminal or command prompt and enter the following command:

        > g++ script.cpp
        > ./a.out
  - After running the above command, you can see respective `.csv` files in the  folder

### 2. Analyzing in Matlab

- We are analyzing the data using the software - **Matlab**
- The folders containing(`.csv`) files has to be uploaded into Matlab after deleting the provided text files
- Download the codes from [this](https://github.com/Pa163361/BTP) repository and upload them into matlab
- Create a text file(ex: paths.txt) for each data folder, and fill it with the paths of all files' of the respective folder

#### 2.1 Reading file names

- Our final code file is **"table_code.m"**
- Enter *"paths.txt"* in the table_code.m file to read it

#### 2.2 Reading data

- Storing the data of each file in a variable of type *table* (a variable for a file) using the inbuilt command `readtable(file_name)`

#### 2.3 Extracting each direction

- The variables which are stored in the previous step are tables
- We extract three different motions from that table into three variables(array type) i.e NS(north-south), EW(east-west), UD(up-down)

#### 2.4 Applying bandpass filter

- We have to apply bandpass filter to the signal inorder to eliminate noise
- `plot_bw` function is written for this part. This function contains the parameters: time, NS, EW, UD, low_freq, high_freq, Sampling freq(Fs), file_name
- In the plot_bw function, we are using the inbuilt function `bandpass(data vector,[low freq, high freq],Fs)`
- So, by calling this function, we can apply filter to a file for it's three motions and also plot them

#### 2.5 Extracting required signal

- The given signal has the data of motions during before, during and after earthquake
- But, we want to analyse the data of earthquake. So, we extract the required signal from the original signal. We do it by calling the function `extract_signal(NS,EW,UD,t1,t2)` where t1 and t2 are the interval(which contains the useful information) points
- After extracting the signal, the length of the data also changes and we are updating it in the code

#### 2.6 Finding peak amplitude

- We have to find the peak amplitude of the signal during earthquake
- For that, we call the function `find_peak(NS,EW,UD)`, which returns the peak for each motion data
- We print those peaks in the console

#### 2.7 Plotting energy signal and finding time duration

  - Plotting energy signal
    
    - We find the cumulative energy of the signal and also the total energy of the signal using the formula: `integral(x(t)^2 dt)` by calling the function `energy_signal` which again calls `cal_cum_energy`
    - Now, we divide the cumulative energy of the signal with the total energy of the signal to get the energy contributions of the signal
  - Finding time duration

    - We consider the signal which contributes from 0.05 to 0.95 part of the energy and finding its duration in time domain which is nothing but TIME DURATION
    - We print this time duration in the console

#### 2.8 Finding the specturm of the signal

- We want the specturm of the signal i.e it's frequency domain equivalent
- For this, we call the function `freq_spectrum`, which again calls the inbuilt function `fft(data vector)`
- After getting the frequency domain values from fft function, we have to scale it to correct frequencies, for that we do some math i.e `f = (0:length(data vector) - 1)*Fs/length(data vector)`
- And we plot it using general plot function

#### 2.9 Smoothening signal

- The data in frequency domain is fast-changing which leads to difficulty in analyzing the trends in the data. To make it slow-changing we use the function `smoothing(NS,EW,UD)` which in turn calls the inbuilt function `smooth(data vector)`

#### 2.10 Finding ratios

- We find the ratios between two sensors data to observe the change in motion of each floor when compared with the ground floor
- For this we call the function `cal_ratios(NS1,EW1,UD1,NS2,EW2,UD2)`. In this function, we are just values of a sensor with ground floor' sensor and returning it.

#### 2.11 Plotting wavelet transform in 2D and 3D

- To plot the wavelet transform of the given data, we use the inbuilt function `cwt(data vector, sampling period)` and using `surf` and `plot` functions to plot it in 3D and 2D respectively.
