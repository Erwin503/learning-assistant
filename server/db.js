const { Sequelize } = require("sequelize");

module.exports = new Sequelize(
  "lAssistent", // Название базы данных
  "root", // Пользователь базы данных
  "Atelier_0809", // Пароль от БД
  {
    host: "localhost",
    dialect: "mysql",
  }
);
