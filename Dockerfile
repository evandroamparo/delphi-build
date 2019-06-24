FROM mcr.microsoft.com/dotnet/framework/runtime:3.5-windowsservercore-ltsc2019 as build

ENV BDS=C:\\Delphi

WORKDIR ${BDS}

COPY delphi/ .

COPY delphi/dcc32.cfg ./bin/

COPY delphi/*.Targets C:/Windows/Microsoft.NET/Framework/v2.0.50727/

COPY /hello.dpr /app/

RUN setx path C:\Windows\Microsoft.NET\Framework\v4.0.30319;%BDS%;%path%

RUN %BDS%\bin\dcc32 \app\hello.dpr

FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY --from=build /app/hello.exe /app/

CMD /app/hello.exe