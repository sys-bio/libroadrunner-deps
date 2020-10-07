import os, sys
import subprocess

def do_check_call(commands:list, error_message=None):
    try:
        cmake_found = subprocess.check_call(commands)
    except subprocess.CalledProcessError as e:
        print(e.output)
        if error_message:
            print(error_message)
        exit(1)

BASE_DIRECTORY = os.getcwd()

# will error if cmake not available
do_check_call(["cmake", "--version"], "Make sure cmake is available and your environment variables are correctly configured to allow the 'cmake' command to be run from shell")

# clone repo
libroadrunner_deps_github = r"https://github.com/CiaranWelsh/libroadrunner-deps.git"
LIBROADRUNNER_DEPS_DIR = os.path.join(BASE_DIRECTORY, "libroadrunner-deps")
do_check_call(["git", "clone", "--recurse-submodules", libroadrunner_deps_github, LIBROADRUNNER_DEPS_DIR])

# make build directory and cd
os.chdir(LIBROADRUNNER_DEPS_DIR)
LIBROADRUNNER_DEPS_BUILD_DIR = os.path.join(LIBROADRUNNER_DEPS_DIR, "build")
os.makedirs(LIBROADRUNNER_DEPS_BUILD_DIR)
os.chdir(LIBROADRUNNER_DEPS_BUILD_DIR)

INSTALL_LOCATION = os.path.join(LIBROADRUNNER_DEPS_DIR, "libroadrunner-deps-travis-install")
# cmake command
do_check_call(["cmake", f"-DCMAKE_INSTALL_PREFIX={INSTALL_LOCATION}", "-DBUILD_LLVM=ON", LIBROADRUNNER_DEPS_DIR])

# build command
do_check_call(["cmake", "--build", LIBROADRUNNER_DEPS_BUILD_DIR])

# install command
do_check_call(["cmake" "--build", "install"])











