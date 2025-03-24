const sql = require("mssql");
async function getPatient() {
  const result = await sql.query`SELECT * FROM [User] WHERE role = 'patient'`;
  return result.recordset;
}

async function getUserByEmail(email, password) {
  const result = await sql.query`SELECT * FROM [User] WHERE email = ${email} AND password = ${password}`;
  return result.recordset;
}

async function checkUserByEmail(email) {
  const result = await sql.query`SELECT * FROM [User] WHERE email = ${email}`;
  return result.recordset;
}

async function getSymptoms() {
  const result = await sql.query`SELECT * FROM [Symptoms]`;
  return result.recordset;
}

async function getDrug() {
  const result = await sql.query`SELECT * FROM [Medicine]`;
  return result.recordset;
}

async function getDrugByID(id) {
  const result = await sql.query`SELECT * FROM [Medicine]  WHERE id = ${id}`;
  return result.recordset[0];
}

async function getPreByPanID(id) {
  const result = await sql.query`SELECT * FROM [Prescription]  WHERE patient_id = ${id}`;
  return result.recordset;
}

async function getPreDetailByID(id) {
  const result = await sql.query`SELECT * FROM [PrescriptionDetail]  WHERE prescription_id = ${id}`;
  return result.recordset;
}


async function deleteStock(medicine_id, quantity) {
  const result = await sql.query`
    UPDATE Medicine
    SET stock = stock - ${quantity}
    WHERE id = ${medicine_id};
    SELECT * FROM Medicine WHERE id = ${medicine_id};
  `;
  return result.recordset[0]; 
}
async function createPrescription(doctor_id, patient_id, instructions) {
  const result = await sql.query`
    INSERT INTO Prescription (doctor_id, patient_id, instructions, created_at)
    VALUES (${doctor_id}, ${patient_id}, ${instructions}, GETDATE());
    SELECT SCOPE_IDENTITY() AS id;
  `;
  return result.recordset[0]; 
}

async function createPrescriptionDetail(prescription_id, medicine_id, quantity) {
  const result = await sql.query`
    INSERT INTO PrescriptionDetail (prescription_id, medicine_id, quantity)
    VALUES (${prescription_id}, ${medicine_id}, ${quantity});
  `;
  return result; 
}

async function deleteFromPres(id) {
  const result = await sql.query`
    Delete From Prescription WHERE id = ${id}`;
  return result; 
}


async function insertIntoPaymen(id,price) {
  const result = await sql.query`
    INSERT INTO Payment (user_id, amount, method, status, service_id)
    VALUES (${id}, ${price}, 'credit_card', 'Pending', 1);
  `;
  return result; 
}

async function register(name,email,password,phone) {
  const result = await sql.query`
    INSERT INTO [User] (name, email, password, phone, role)
    VALUES (${name}, ${email}, ${password}, ${phone}, 'patient');
  `;
  return result; 
}
async function getPaymentByID(id) {
  const result = await sql.query`SELECT * FROM [Payment]  WHERE user_id = ${id}`;
  return result.recordset; 
}

async function getAllService() {
  const result = await sql.query`SELECT * FROM [Service]`;
  return result.recordset;
}
module.exports = {
  getPatient,getUserByEmail,createPrescription,getPreDetailByID,deleteFromPres,insertIntoPaymen,register,getAllService,
  getSymptoms,getDrug,createPrescriptionDetail,getDrugByID,deleteStock,getPreByPanID,getPaymentByID,checkUserByEmail
};
