@echo off

@REM Find first image file
FOR %%F IN (image\*.rpm) DO (
 set image=%%~nxF
 goto find_image
)

@REM Build image
:find_image
docker build -t rsubd --force-rm=true --no-cache=true --build-arg ORACLE_PWD="Passw0rd" --build-arg IMAGE_FILE="image/%image%" -f bin\Dockerfile .

@REM Build and run container
docker run --name oracledb -p 1521:1521 -p 5500:5500 -p 8080:8080 --cpus=0.5 -m 2g -td rsubd
