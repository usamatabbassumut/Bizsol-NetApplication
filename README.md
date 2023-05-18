
# Bizsol Assessment

A sample ASP.NET Core project which implements the code first approach to create the database. This sample application features a layered structure keeping the business logic, database connectivity, UI and Models at different layers to keep the code clean. The application performs a simple CRUD operation for a 'BizSol User'.


## Run migration to create database
- After updating your connection string in appsettings.json, run migration in Package Manager Console to create database.
- Select the default project to INFRASTUCTURE as we have the DbContext class in this project. Then run the following command.

```
update-database
```

![App Screenshot](https://raw.githubusercontent.com/usamatabbassumut/Bizsol-NetApplication/master/BizsolAssessment/wwwroot/Instructions/create-database-with-migration.png)

