const Router = require("express");
const router = new Router();

const {
  create,
  getAll,
  getOne,
  getByUser,
  deleteItem,
  updateItem,
  findBlockByName,
  // getViewedBlocksByUserId,
  // addBlockToViewed
} = require("../controllers/blockController.js");

router.post("/", create);
router.get("/", getAll);
router.get("/:id", getOne);
router.get("/user/:userId", getByUser);
router.get("/name/:name", findBlockByName);
router.delete("/:id", deleteItem);
router.put("/:id", updateItem);
// router.post("/viewed", addBlockToViewed);
// router.get("/viewed/:id", getViewedBlocksByUserId);


module.exports = router;
