const Router = require("express");
const router = new Router();

const {
  create,
  getAll,
  getOne,
  deleteItem,
  updateItem,
  getSchedulesByUserId,
  getSchedulesByGroupId,
} = require("../controllers/schedulesController.js")

router.post("/", create);
router.get("/", getAll);
router.get("/:id", getOne);
router.get("/user/:userId", getSchedulesByUserId);
router.get("/group/:groupId", getSchedulesByGroupId);
router.delete("/:id", deleteItem);
router.put("/:id", updateItem);

module.exports = router;
