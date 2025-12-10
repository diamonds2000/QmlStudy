cmake_minimum_required(VERSION 3.16)
project(QMLStudy VERSION 1.0.0 LANGUAGES CXX)

# Set Debug build type as default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Find Qt6 packages - Widgets is required for QtCharts to work properly
find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Widgets Qml Quick Charts QuickControls2)

# Set the application sources
set(PROJECT_SOURCES
    src/main.cpp
    src/dockwindow.h
    src/dockwindow.cpp
    src/chartpanel.h
    src/chartpanel.cpp
    src/righttoolbar.h
    src/righttoolbar.cpp
    src/treeview.h
    src/treeview.cpp
    qml.qrc
)

# Create the executable
qt_add_executable(${PROJECT_NAME}
    ${PROJECT_SOURCES}
)

# Link Qt libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::Qml
    Qt6::Quick
    Qt6::Charts
    Qt6::QuickControls2
)

# Set properties
set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)

# Install the executable
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
