<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://avatars.githubusercontent.com/u/45662503?v=4g" alt="Project logo"></a>
</p>

<h3 align="center">Project Duat</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/Herdanis/Duat)](https://github.com/Herdanis/Duat/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Herdanis/Duat)](https://github.com/Herdanis/Duat/pulls)
[![License](https://img.shields.io/github/license/Herdanis/Duat)](/LICENSE)

</div>

---

## 📝 Table of Contents

-   [About](#about)
-   [Getting Started](#getting_started)
-   [Installing](#installing)
-   [Usage](#usage)
-   [Built Using](#built_using)
-   [Authors](#authors)

## 🧐 About <a name = "about"></a>

Duat is OpenSource project which is the script to remote or locally backup database like mysql, postgre, etc.

## 🏁 Getting Started <a name = "getting_started"></a>

You need your user for connect to database. If you using remote database please check the firewall and ip rule on database config. We recommend not give userbackup privilage to write database or table.

### Installing

Just run init.sh to setup your file. 
```
bash init.sh
```
After that edit `.env`. You must setup the path to save the database and time periode database will be save
```
TIME_PERIOD=30 // by default 30 days

PATH_BACKUP=PATH // required
```

For example we want to backup the mysql, change the variable for mysql
```
MYSQL_HOST=127.0.0.1
MYSQL_PORT=3306
MYSQL_USERNAME=username
MYSQL_PASSWORD=password
MYSQL_DATABASE=db_name
```

🗒 Note : you do not have to setup all environment variable just select variable you want to backup

## 🎈 Usage <a name="usage"></a>

Run with `bash` or `sh` it will automatic run the command
```
bash mysql.sh
```

If you want to run automatic everyday use cronjob to run it, just setup in crotab

Example run cronjob at 00.01 AM every day
```
1 00 * * * bash /path/to/file/mysql.sh
```

## ⛏️ Built Using <a name = "built_using"></a>

- [Bash](https://www.gnu.org/software/bash/) - Command Language
- [Mysql](https://www.mysql.com/) - Database
- [Postgre](https://www.postgresql.org/) - Database
- [crontab guru](https://crontab.guru/) - crontab

## ✍️ Authors <a name = "authors"></a>

-   [@Herdanis](https://github.com/Herdanis) - Idea & Initial work

See also the list of [contributors](https://github.com/Herdanis/Duat/graphs/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- https://www.postgresql.org/docs/current/app-pgdump.html
- https://stackoverflow.com/a/24158972
- https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html
