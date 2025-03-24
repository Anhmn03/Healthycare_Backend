const express = require("express");
const sql = require('mssql');
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const User = require("./src/routers/router");
dotenv.config();
const cors = require("cors");
const app = express();
app.use(bodyParser.json());
app.use(cors());

// // app.use("/projects", projectRouter);
// app.use("/employees", employeeRouter.findAllEm);
// app.use("/employees/:id", employeeRouter.findEmpByDeparment);
// // app.use("/departments", departmentRouter);
// app.use("/employees", employeeRouter.addNewEmp);
// app.use("/employees", employeeRouter.updateEmp);
// app.use("/",Customer.checkLogin);

app.use("/user/",User.getAllPanti);
app.use("/user/",User.login);
app.use("/user/",User.cretePrescription);
app.use("/user/",User.viewAllDrug);
app.use("/user/",User.viewPrescriptionByPantientID);
app.use("/user/",User.register);
app.use("/user/",User.getAllService);
app.use("/user/",User.bookingDrugAndSendToPay);
app.use("/user/",User.denyOrder);
const config = {
  user: 'sa', 
  password: '123',
  server: 'localhost', 
  database: 'HealthcareSystem',
  options: {
    encrypt: true,
    trustServerCertificate: true 
  }
};

async function connectDatabase() {
  try {
    await sql.connect(config);
    console.log("Kết nối thành công đến SQL Server!");
  } catch (err) {
    console.error("Kết nối thất bại:", err);
  }
}

// Gọi hàm kết nối
connectDatabase();
app.listen(9999, () => {
    console.log(`Server đang chạy tại http://localhost:${9999}`);
  });
