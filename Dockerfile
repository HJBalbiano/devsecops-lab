# ---------- BUILD ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

WORKDIR /src

COPY DevSecOpsLab.sln ./

COPY src/DevSecOps.Api/DevSecOps.Api.csproj \
     src/DevSecOps.Api/

COPY tests/DevSecOps.Api.Tests/DevSecOps.Api.Tests.csproj \
     tests/DevSecOps.Api.Tests/

RUN dotnet restore

COPY . .

RUN dotnet publish src/DevSecOps.Api/DevSecOps.Api.csproj \
    -c Release \
    -o /app/publish \
    --no-restore


# ---------- RUNTIME ----------
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080

USER $APP_UID

ENTRYPOINT ["dotnet", "DevSecOps.Api.dll"]
