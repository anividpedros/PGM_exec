# PGM Executable

## Setup

1. Create folder `Files/` and add `.obj` of choice       
2. Create `GravityFile.txt` using `make`
3. Create mex 
4. Run in MATLAB

## Generate GravityFile.txt
```
  make CreateGravFile
```

## Generate mex
```
  make mexPolyGrav
```

## Usage in MATLAB

```matlab
  addpath('bin/');
  g = mexPolyGrav([0.02; 0; 0.26]);
```
