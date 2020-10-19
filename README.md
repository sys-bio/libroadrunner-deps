[![Build Status](https://dev.azure.com/TheRoadrunnerProject/libroadrunner-deps/_apis/build/status/libroadrunner-deps?repoName=sys-bio%2Flibroadrunner-deps&branchName=develop-new-buildsystem)](https://dev.azure.com/TheRoadrunnerProject/libroadrunner-deps/_build/latest?definitionId=9&repoName=sys-bio%2Flibroadrunner-deps&branchName=develop-new-buildsystem)
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

| WARNING: On Windows use the "x64 developer tools shell" rather than cmd or powershell. This ensures you build 64-bit roadrunner.
| --- |

```
$ git clone https://github.com/CiaranWelsh/libroadrunner-deps.git
$ cd libroadrunner-deps
$ mkdir build
$ cd build
$ cmake -DCMAKE_INSTALL_PREFIX="../install-release" -DCMAKE_BUILD_TYPE=Release ..
$ cmake --build . --target install --config Release
```
  
Replace `Release` with another configuration (like Debug) to build in another cmake configuration.
   
   
   
   
   
   
   
   
   
   
   
 
