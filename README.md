[![Build Status](https://dev.azure.com/TheRoadrunnerProject/libroadrunner-deps/_apis/build/status/libroadrunner-deps?branchName=master)](https://dev.azure.com/TheRoadrunnerProject/libroadrunner-deps/_build/latest?definitionId=9&branchName=master)
# libroadrunner-deps
Dependencies for Roadrunner. See http://libroadrunner.org/ for more info on Roadrunner.

## Prebuilt binaries
May be available under the [releases section](https://github.com/CiaranWelsh/libroadrunner-deps/releases/tag/v2.0.1). Be sure to check that the compiler you are using matches the one used for building the prebuilt binaries. If not, you will have to build yourself. 

## Build instructions   
Assuming cmake is ready for usage:

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
   
   
   
   
   
   
   
   
   
   
   
 
