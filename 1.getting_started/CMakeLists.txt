# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name
project(Getting_Started)

# Tell CMake to use C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find the OpenGL library (comes with your system)
find_package(OpenGL REQUIRED)

# Find the GLFW library we installed with pacman
find_package(glfw3 REQUIRED)

# Add our executable.
# The first argument is the name we want to give our program.
# The next arguments are the source files needed to build it.
add_executable(my_app src/Hello_Window.cpp src/glad.c)

# Tell our executable where to find its header files.
# In our case, the "include" folder.
target_include_directories(my_app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Link the necessary libraries to our executable.
# Our program "my_app" needs to link against OpenGL and GLFW.
target_link_libraries(my_app PRIVATE OpenGL::GL glfw)