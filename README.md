# PGM Executable

## Setup

1. Add `.obj` file of choice in `Files/`      
2. Create `GravityFile.txt`
3. Create MEX executable
4. Run in MATLAB

## Generate `GravityFile.txt`
```
  make CreateGravFile
```
* Add path as: Files/name.obj and provide density value

## Generate MEX
```
  make mexPolyGrav
```

## Usage in MATLAB

```matlab
  addpath('bin/');
  g = mexPolyGrav([0.02; 0; 0.26]);
```
