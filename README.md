# delphi-build

![Docker Image CI](https://github.com/evandroamparo/delphi-build/workflows/Docker%20Image%20CI/badge.svg)

Docker image do build Delphi 2007 applications inside a container.

https://hub.docker.com/r/evandroamparo/delphi2007-build

1. Pull: `docker pull evandroamparo/delphi2007-build`

2. Run:

   Powershell
   
   `docker run -v ${pwd}:C:\app --rm evandroamparo/delphi2007-build cmd /c "cd C:\app & msbuild YourProject.dproj"`

   Cmd
   
   `docker run -v %cd%:C:\app --rm evandroamparo/delphi2007-build cmd /c "cd C:\app & msbuild YourProject.dproj"`
