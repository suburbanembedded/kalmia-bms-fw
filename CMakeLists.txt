cmake_minimum_required(VERSION 3.8)

project(kalmia-bms-fw
	C CXX ASM
)

add_definitions(
	-DCPU_S32K144HFT0VLLT
)

include_directories(
	include
)

add_subdirectory(external/emb_util)
add_subdirectory(external/peripheral_drivers)
add_subdirectory(external/common_util)

add_executable(kalmia-bms-fw
	
	Project_Settings/Startup_Code/startup.c
	Project_Settings/Startup_Code/startup_S32K144.S
	Project_Settings/Startup_Code/system_S32K144.c


	src/main.cpp
)

target_link_libraries(kalmia-bms-fw
	emb_util
	peripheral_drivers
	common_util
)
