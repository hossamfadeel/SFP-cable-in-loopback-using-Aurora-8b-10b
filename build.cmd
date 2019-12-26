@echo # --------------------------------------------------------------------
@echo # --$Autor: Hassan, Hossam 		$
@echo # --$Create Date:2019/12/26 		$
@echo # --$Modify Date: ********* 		$
@echo # --$Version: 1.0					$
@echo # --------------------------------------------------------------------
@echo # --------------------------------------------------------------------
@echo # --------------------------------------------------------------------

@REM set local environment
setlocal
@echo ------------------------Set design paths----------------------------
@REM get paths
@set CurrentDirectory=%~d0
@set ProjectPath=%~dp0
@REM change drive -- in cmd 
@%CurrentDirectory%
@REM change path to batchfile folder
@cd %ProjectPath%

@REM # Important Settings:
@REM # -------------------------
@REM Set Vivado Installation path:
@set XILDIR=D:/Xilinx
@set VIVADO_VERSION=2018.2
@REM --------------------
@REM --------------------
@REM Do not close shell after processing
@REM  -Example: @set DO_NOT_CLOSE_SHELL=1, Shell will not be closed
@REM            @set DO_NOT_CLOSE_SHELL=0, Shell will be closed automatically
@set DO_NOT_CLOSE_SHELL=0

@echo ------------------------Set design paths----------------------------
@set VIVADO_XSETTINGS=%XILDIR%\Vivado\%VIVADO_VERSION%\.settings64-Vivado.bat
@REM @set SDK_XSETTINGS=%XILDIR%\SDK\%VIVADO_VERSION%\.settings64-SDK_Core_Tools.bat
@REM # --------------------
@echo -- Use Xilinx Version: %VIVADO_VERSION% --
@if not defined VIVADO_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx Vivado Settings --
  @if not exist %VIVADO_XSETTINGS% ( @echo -- Info: %VIVADO_XSETTINGS% not found --
  ) else (
    @call %VIVADO_XSETTINGS%
    @set VIVADO_AVAILABLE=1
  )
  @set VIVADO_XSETTINGS_ISDONE=1
)

@REM check important settings
@if %VIVADO_AVAILABLE%==1 (
  @goto  RUN
  PAUSE
)

@echo -- Error: Need Vivado to run. --
@if not exist %XILDIR% ( @echo -- Error: %XILDIR% not found. Check path of XILDIR variable on design_basic_settings.sh (upper and lower case is important)
) 
@goto  ERROR

:RUN
@echo --------------------------------------------------------------------
@echo Start create project..."
@cd %ProjectPath%
@echo Project Directory is: %ProjectPath% 
@echo --------------------------------------------------------------------
@echo --------------------------------------------------------------------
@echo -------------------------Start VIVADO scripts -----------------------
vivado -mode gui -source  build.tcl   -notrace 
PAUSE
@echo -------------------------scripts finished----------------------------
@echo --------------------------------------------------------------------
@echo --------------------Change to Project Folder-------------------------
@cd..
@echo ------------------------Design finished-----------------------------
@if not defined DO_NOT_CLOSE_SHELL (
  @set DO_NOT_CLOSE_SHELL=0
)
@if %DO_NOT_CLOSE_SHELL%==1 (
  PAUSE
)
GOTO EOF
