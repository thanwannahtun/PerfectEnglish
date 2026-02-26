@echo off
setlocal

REM Path to the Flutter SDK you want this project to use
set FLUTTER_SDK=C:\Users\thanwannahtun\dev\flutter_3_35_7\bin\flutter.bat

REM Call flutter with all arguments passed
"%FLUTTER_SDK%" %*
