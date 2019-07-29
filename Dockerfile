FROM mcr.microsoft.com/dotnet/framework/runtime:3.5-windowsservercore-ltsc2019 as build

ENV BDS=C:\\Delphi

ENV FRAMEWORKDIR=C:\\Windows\\Microsoft.NET\\Framework\\v2.0.50727

COPY delphi/ ${BDS}

COPY delphi/*.Targets ${FRAMEWORKDIR}/

COPY Geoservicos/ /app/

COPY componentes/LockBox/* /app/lib/

COPY componentes/mxOutlookBar/* /app/lib/

COPY ["componentes/Quick Report/*", "/app/lib/"]

RUN %FRAMEWORKDIR%\msbuild \app\src\Geoserviços.dproj /target:Build /p:config=Release

FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY --from=build /app/bin/ /app/