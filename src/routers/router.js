const express = require("express");
const {
  getPatient,
  getUserByEmail,
  createPrescription,
  getSymptoms,getHealth,getHealthByID,
  getDrug,
  deleteFromPres,
  createPrescriptionDetail,
  getDrugByID,
  getPaymentByID,getLastPayment,
  register,
  deleteStock,
  getPreByPanID,
  getPreDetailByID,getPreDetail,
  checkUserByEmail,
  insertIntoPaymen,
  getAllService,
} = require("../query/query");
const app = express();

module.exports = {
  getAllPanti: app.get("/pantient", async (req, res) => {
    try {
      const users = await getPatient();
      res.status(200).json({
        success: true,
        data: users,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi khi lấy dữ liệu người dùng.",
      });
    }
  }),
  login: app.post("/login", async (req, res) => {
    try {
      const { email, password } = req.body;
      const user = await getUserByEmail(email, password);
      if (user && user.length > 0) {
        res.status(200).json({
          message: "dang nhap thanh cong"
        });
      } else {
        res.json({ success: false, message: "Sai email hoặc mật khẩu" });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi khi lấy dữ liệu người dùng.",
      });
    }
  }),
  cretePrescription: app.post("/createprescription", async (req, res) => {
    const { doctor_id, patient_id, instructions, medicines } = req.body;

    try {
      for (const item of medicines) {
        const stock = await getDrugByID(item.medicine_id);
        if (!stock) {
          return res.status(400).json({
            success: false,
            message: `Thuốc với ID ${item.medicine_id} không tồn tại.`,
          });
        }

        if (item.quantity > stock.stock) {
          return res.status(400).json({
            success: false,
            message: `Không đủ thuốc "${stock.name}" trong kho.`,
          });
        }
      }
      const prescription = await createPrescription(
        doctor_id,
        patient_id,
        instructions
      );
      for (const item of medicines) {
        const detail = await createPrescriptionDetail(
          prescription.id,
          item.medicine_id,
          item.quantity
        );
        if (!detail) {
          return res.status(500).json({
            success: false,
            message: `Không tạo được chi tiết đơn thuốc cho thuốc ID ${item.medicine_id}`,
          });
        }
        await deleteStock(item.medicine_id, item.quantity);
      }
      res.status(201).json({
        success: true,
        message: "Tạo đơn thuốc thành công",
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi khi tạo đơn thuốc",
      });
    }
  }),
  viewHealthcare: app.get("/healthcare", async (req, res) => {
    try {
      const sym = await getHealth();
      res.status(200).json({
        success: true,
        data: sym,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  viewHealthDetail: app.get("/healthcare/:id", async (req, res) => {
    try {
      const sym = await getHealthByID(req.params.id);
      res.status(200).json({
        success: true,
        data: sym,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  viewAllDrug: app.get("/medicine", async (req, res) => {
    try {
      const drug = await getDrug();
      res.status(200).json({
        success: true,
        data: drug,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  viewDrugDetail: app.get("/medicine/:id", async (req, res) => {
    try {
      const drug = await getDrugByID(req.params.id);
      res.status(200).json({
        success: true,
        data: drug,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  viewPrescriptionByPantientID: app.get(
    "/prescription",
    async (req, res) => {
      try {
        const id = req.query.panid;
        const prescriptions = await getPreByPanID(id);
        const allDetails = [];
        for (const prescription of prescriptions) {
          const details = await getPreDetailByID(prescription.id);
          allDetails.push({
            prescription_id: prescription.id,
            doctor_id: prescription.doctor_id,
            instructions: prescription.instructions,
            created_at: prescription.created_at,
            details: details,
          });
        }
        return res.json({
          success: true,
          prescriptions: allDetails,
        });
      } catch (error) {
        console.error(error);
        res.status(500).json({
          success: false,
          message: "Lỗi.",
        });
      }
    }
  ),
  viewPrescriptionDetail: app.get("/prescription/:prescription_id", async (req, res) => {
    try {
      const id = req.params.prescription_id;
      const result = await getPreDetail(id);
      const groupedResult = result.reduce((acc, item) => {
        let prescription = acc.find(pres => pres.id === item.id);
        if (!prescription) {
          prescription = {
            id: item.id,
            doctor_id: item.doctor_id,
            patient_id: item.patient_id,
            instructions: item.instructions,
            medicines: []
          };
          acc.push(prescription);
        }
        prescription.medicines.push({
          name: item.name,
          quantity: item.quantity
        });
        return acc;
      }, []);
      return res.json({
        success: true,
        data: groupedResult,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  confirmOrderAndGetAllPaymentByUserID: app.get(
    "/confirm",
    async (req, res) => {
      try {
        const { patient_id, idPresc } = req.body;
        const prescriptions = await getPreByPanID(patient_id);
        console.log(prescriptions)
        const selectedPrescription = prescriptions.find(
          (p) => p.id === (idPresc)
        );
        if (!selectedPrescription) {
          return res.status(404).json({
            success: false,
            message: "Không tìm thấy đơn thuốc này cho bệnh nhân",
          });
        }
        const prescriptionDetails = await getPreDetailByID(idPresc);
        let totalPrice = 0;
        for (const item of prescriptionDetails) {
          const drug = await getDrugByID(item.medicine_id);
          if (drug) {
            totalPrice += drug.price * item.quantity;
          }
        }
        const deleteFromPresc = await deleteFromPres(idPresc);
        const insertIntoPayment = await insertIntoPaymen(
          patient_id,
          totalPrice
        );
        const result3 = await getLastPayment(patient_id);
        res.status(200).json({
          success: true,
          data: result3,
        });
      } catch (error) {
        console.error(error);
        res.status(500).json({
          success: false,
          message: "Lỗi.",
        });
      }
    }
  ),
  denyOrder: app.delete("/reject/:idPresc", async (req, res) => {
    try {
      const idPresc = req.params.idPresc;
      const deleteFromPresc = await deleteFromPres(idPresc);
      res.status(200).json({
        success: "xoa thanh cong",
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Lỗi.",
      });
    }
  }),
  register: app.post("/register", async (req, res) => {
    try {
      const { name, email, password, phone } = req.body;
      const check = await checkUserByEmail(email);
      if (!check) {
        return res.status(200).json({
          success: "Nguoi dung email da ton tai",
        });
      }
      const user = await register(name, email, password, phone);
      return res.status(200).json({
        success: "DANG KI THANH CONG",
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Nguoi dung email da ton tai.",
      });
    }
  }),
  getAllService: app.get("/service", async (req, res) => {
    try {
      const data = await getAllService();
      return res.status(200).json({
        success: true,
        data: data,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "Nguoi dung email da ton tai.",
      });
    }
  }),
  bookingDrugAndSendToPay: app.post("/bookingdrug", async (req, res) => {
    try {
      const { userid, medicines } = req.body;
      let totalPrice = 0;
      for (const item of medicines) {
        totalPrice += item.price * item.quantity;
      }
      const insertPayment = await insertIntoPaymen(userid, totalPrice);
      const result3 = await getPaymentByID(userid);
      res.status(200).json({
        success: true,
        data: result3,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({
        success: false,
        message: "er.",
      });
    }
  }),
};
