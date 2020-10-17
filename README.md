# libroadrunner-deps
Dependencies for Roadrunner. See http://libroadrunner.org/ for more info on Roadrunner.

## Prebuilt binaries
May be available under the [releases section](https://github.com/CiaranWelsh/libroadrunner-deps/releases/tag/v2.0.1). Be sure to check that the compiler you are using matches the one used for building the prebuilt binaries. If not, you will have to build yourself. 

## Build instructions
### Method 1: Use the Python script provided
This python script is a simple wrapper around cmake commands. It is assumed you have cmake and the cmake bin directory 
is added to the system PATH variable so that the "cmake" command works from the system shell.
1. Download the python script by [clicking here](https://raw.githubusercontent.com/CiaranWelsh/libroadrunner-deps/master/roadrunner_deps_build.py). Put it in the directory you want to build libroadrunner-deps
2. Run: 
    - `python roadrunner_deps_build.py --help` 

2. Run the python script using the relevant options:
    - `python roadrunner_deps_build.py /path/to/install/location --with-llvm --build-type=Release`
    
   
### Method 2: Use CMake directly
Again, assuming cmake is ready for usage:

| WARNING: On Windows be especially careful that you are building for the correct bitness. Sometimes Windows will default to 32-bit builds and usually the preference is x64. Easy fix is to use the x64 developers command prompt or powershell.|
| --- |

```
$ git clone https://github.com/CiaranWelsh/libroadrunner-deps.git
$ cd libroadrunner-deps
$ mkdir build
$ cd build
$ 
```
   
   
   
   
   
   
   
   
   
   
   
   
 