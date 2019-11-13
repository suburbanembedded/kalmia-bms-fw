set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(S32_ROOT "$ENV{HOME}/NXP/S32DS_ARM_v2018.R1")
set(S32_TOOL_PATH "${S32_ROOT}/Cross_Tools/gcc-arm-none-eabi-4_9/bin")
set(S32_SYSROOT "${S32_ROOT}/Cross_Tools/gcc-arm-none-eabi-4_9/arm-none-eabi/newlib")
set(S32K1_FLASH_LD "${PROJECT_SOURCE_DIR}/Project_Settings/Linker_Files/S32K1xx_flash.ld")

set(CMAKE_ASM_COMPILER ${S32_TOOL_PATH}/arm-none-eabi-gcc)
set(CMAKE_C_COMPILER   ${S32_TOOL_PATH}/arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER ${S32_TOOL_PATH}/arm-none-eabi-g++)

set(C_STANDARD 99)
set(CMAKE_C_EXTENSIONS   OFF)
set(CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)

set( ARCH_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -specs=nosys.specs --sysroot=${S32_SYSROOT}")
set( GEN_FLAGS  "-fstrict-volatile-bitfields -ffunction-sections -fdata-sections -fstack-usage")
set( WARN_FLAGS "-Wall -Werror=return-type")

set(CMAKE_ASM_FLAGS 				"${ARCH_FLAGS} ${GEN_FLAGS} ${WARN_FLAGS} -std=c99 -Wa,--warn -x assembler-with-cpp" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_DEBUG 			"-Og -g3"	CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELEASE 		"-Os"		CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO 	"-Os -g3"	CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_MINSIZEREL 		"-Os"		CACHE STRING "" FORCE)

set(CMAKE_C_FLAGS 					"${ARCH_FLAGS} ${GEN_FLAGS} ${WARN_FLAGS} -std=c99" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_DEBUG 			"-Og -g3"	CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE 			"-Os"		CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO 	"-Os -g3"	CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_MINSIZEREL 		"-Os"		CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS 				"${ARCH_FLAGS} ${GEN_FLAGS} ${WARN_FLAGS} -std=c++14 -fno-threadsafe-statics" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG 			"-Og -g3"	CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE 		"-Os"		CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO 	"-Os -g3"	CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_MINSIZEREL 		"-Os"		CACHE STRING "" FORCE)

set(CMAKE_EXE_LINKER_FLAGS "-T${S32K1_FLASH_LD} -Wl,-Map,\"test.map\" -Xlinker --gc-sections" CACHE STRING "" FORCE)
