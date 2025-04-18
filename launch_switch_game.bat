@echo off
setlocal enabledelayedexpansion

:: Load IP address from config.txt
for /f "tokens=2 delims==" %%a in ('findstr /i "ip=" config.txt') do set IP_ADDRESS=%%a

:: Ensure the Title ID is passed correctly
if "%1"=="" (
    echo No Title ID passed. Please provide a Title ID as an argument.
    exit /b
)

:: Get the argument (Title ID)
set titleId=%1
echo Received Title ID: %titleId%

:: Check if the Title ID contains letters (A-F) indicating hexadecimal format
echo %titleId% | findstr /r "[A-Fa-f]" >nul
if %errorlevel%==0 (
    echo Hexadecimal Title ID detected. Converting to Decimal:

    :: Convert the hexadecimal to decimal
    for /f "delims=" %%i in ('powershell -Command "[Convert]::ToInt64('%titleId%', 16)"') do set decimalAppId=%%i

    :: Check if the conversion was successful
    if "!decimalAppId!"=="" (
        echo Error: Conversion failed.
        exit /b
    )

    echo Final Decimal App ID: !decimalAppId!

    :: Set the appId
    set appId=!decimalAppId!
) else (
    :: Use Title ID directly if it's already in Decimal form
    echo Title ID is already in Decimal format.
    set appId=%titleId%
)

:: Debugging: Show the final appId that will be used
echo Final appId being used: !appId!

:: If the appId is valid, send the curl request
if defined appId (
    curl -X POST "http://%IP_ADDRESS%:8080/launch" ^
        -H "Accept: */*" ^
        -H "Content-Type: application/json" ^
        --data-raw "{\"appId\":\"!appId!\"}" ^
        --insecure
) else (
    echo Error: App ID is not valid.
)
