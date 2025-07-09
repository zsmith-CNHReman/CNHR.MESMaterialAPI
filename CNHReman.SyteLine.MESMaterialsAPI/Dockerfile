#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# Use the official .NET runtime as a base image for the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Use the official .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy the project file and restore dependencies
COPY ["CNHReman.SyteLine.MESMaterialsAPI/CNHReman.SyteLine.MESMaterialsAPI.csproj", "CNHReman.SyteLine.MESMaterialsAPI/"]
RUN dotnet restore "CNHReman.SyteLine.MESMaterialsAPI/CNHReman.SyteLine.MESMaterialsAPI.csproj"

# Copy the rest of the application source code
COPY . .
WORKDIR "/src/CNHReman.SyteLine.MESMaterialsAPI"

# Build the application
RUN dotnet build "CNHReman.SyteLine.MESMaterialsAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish the application
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "CNHReman.SyteLine.MESMaterialsAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Use the runtime base image for the final stage
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CNHReman.SyteLine.MESMaterialsAPI.dll"]
