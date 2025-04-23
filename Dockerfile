FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
WORKDIR /app

COPY *.csprodj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /appCOPY --from=build /app/out ./

ENTRYPOINT ["dotnet", "TutorOfficeApi.dll"]