# library_project

Set up database

cài docker desktop

chạy 2 lệnh này

docker pull mcr.microsoft.com/mssql/server:2022-latest

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Mysql@123" -p 1433:1433 --name sql1 --hostname sql1 -v sql_data:/var/opt/mssql -d mcr.microsoft.com/mssql/server:2022-latest

docker cp "D:\Study\Project\Java\Library-Management-System-Java\Data\SQLServer\script.sql" sql1:/script.sql (thay bằng đường dẫn file script.sql trong folder Data)

docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Mysql@123 -i /script.sql

Chạy project như trong video demo
