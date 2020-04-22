FROM mcr.microsoft.com/dotnet/framework/runtime:3.5-windowsservercore-ltsc2019 as build

ENV BDS=C:\\Delphi

ENV FRAMEWORKDIR=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727

ENV Win32LibraryPath=${BDS}\\lib;c:\\windows\\system32

RUN setx path "%path%;%FRAMEWORKDIR%"

COPY delphi/ ${BDS}

COPY delphi/dcc32.cfg ${BDS}\\bin

COPY delphi/*.Targets ${FRAMEWORKDIR}/

COPY componentes/Componentes-Delphi-2007.exe c:/

RUN c:\Componentes-Delphi-2007.exe /VERYSILENT /SUPPRESSMSGBOXES /components=lockbox,outlookbar,quickreport4,ibexpress /log=log.txt & \
    DEL c:\Componentes-Delphi-2007.exe