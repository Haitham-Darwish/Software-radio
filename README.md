# Software-radio

<p align="center">
<img src="https://user-images.githubusercontent.com/68920161/166302706-74dbfeb7-07bd-474a-9000-e2cfe891aa2d.gif" , alt="Software radio.gif">
</p>

# Introduction

Software radio is the technique used to get the programmer's code as close to the 
antenna as possible. It turns radio hardware problems into software problems. The 
fundamental characteristic of software radio is that software defines the transmitted 
waveforms, and software demodulates the received waveforms. This is in contrast to 
most radios in which the processing is done with either analog circuitry or analog 
circuitry combined with digital chips.

![Tx_Rx](https://user-images.githubusercontent.com/68920161/166295496-6ea4de41-264b-4eb6-a085-84856795d997.png)

Your code at the transmitter defines the modulation technique, the coding used, … etc. 
The software can also be used to send data through cables, simply remove the antenna 
and use line codes. The software converts the files into a bit stream, makes framing, 
coding and then line coding. To know how this can happen, consider the following 
simplified example:
If you want to transmit binary data 0 1 0 0 1 1 0 1 using polar NRZ signaling, 
with pulse width=70 ms, and the DAC is activated every 10 ms, the software 
needs to feed the DAC with new data every 10ms. For polar NRZ , logic '1' is 
transmitted as voltage level +A, logic '0' is transmitted as voltage level –A.

The output of the DAC can be considered as a random process, due to the 
randomness of the transmitted bits and exact timing of the beginning of 
transmission.

We have generated an ensemble that consists of 500 waveforms, each 
containing 100 bits, for the line codes mentioned below, then we investigated

1. The statistical mean.
2. Is the random process stationary?
3. Determine the ensemble autocorrelation function Rx(τ). 
4. The time mean and autocorrelation function for one waveform.
5. Is the random process Ergodic?
6. What is the bandwidth of the transmitted signal.

The line codes required to be investigated are:

1. Unipolar Signaling
![unipolar](https://user-images.githubusercontent.com/68920161/166296235-7b07ffc7-a7e1-4d7a-960a-ec0ccc7f9a64.png)
![unipolar](https://user-images.githubusercontent.com/68920161/166298414-67a28aa8-9d04-4a70-bd97-9428736582c1.png)

2. Polar Non Return to Zero
![polar](https://user-images.githubusercontent.com/68920161/166296347-99c30c2c-ad5d-4211-9d55-3f86f59cf93a.png)
![polar](https://user-images.githubusercontent.com/68920161/166297932-d4b4d376-5731-4118-8749-0778f743338f.png)
3. Return to Zero
![return to zero](https://user-images.githubusercontent.com/68920161/166296525-3e79153c-9550-4d1e-9b91-0e10bd1fc77a.png)
![return to zero](https://user-images.githubusercontent.com/68920161/166298665-01e298f3-f1d6-44a0-a495-7953020aaa8d.png)

