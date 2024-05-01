const { User, Block } = require("../models/models");
const { badRequest } = require("../error/ApiError");

class blockController {
  async create(req, res, next) {
    try {
      let { description, icon, userId, color, categoryId, name } = req.body;

      const block = await Block.create({
        description,
        icon,
        userId: Number(userId),
        color,
        name,
        categoryId: Number(categoryId),
      });
      const response = {
        data: block,
        request: {
          type: "GET",
          url: "http://localhost:3000/api/block/" + block.id,
        },
      };
      return res.status(200).json(response);
    } catch (e) {
      next(badRequest(e.message));
    }
  }

  async getAll(req, res) {
    const blocks = await Block.findAll({
      attributes: ["description", "icon", "id", "name"],
    });
    if (blocks.length === 0) {
      return res.status(200).json({ message: "No blocks found" });
    }
    const response = {
      count: blocks.length,
      data: blocks.map((block) => {
        return {
          description: block.description,
          name: block.name,
          icon: block.icon,
          id: block.id,
          color: block.color,
          categoryId: block.categoryId,
          request: {
            type: "GET",
            url: "http://localhost:3000/api/block/" + block.id,
          },
        };
      }),
    };
    return res.status(200).json(response);
  }

  async getOne(req, res) {
    const { id } = req.params;
    const block = await Block.findOne({
      where: {
        id,
      },
    });
    if (!block) {
      return res.status(404).json({ error: "Block not found" });
    }
    const response = {
      data: block,
    };
    return res.status(200).json(response);
  }

  async deleteItem(req, res) {
    const { id } = req.params;
    const block = await Block.destroy({
      where: {
        id,
      },
    });
    const response = {
      message: "Deleted. To get all blocks type this request",
      request: {
        type: "GET",
        url: "http://localhost:3000/api/block",
      },
      data: block,
    };
    return res.status(200).json(response);
  }

  async getByUser(req, res) {
    const { userId } = req.params;
    const blocks = await Block.findAll({
      where: {
        userId,
      },
    });
    if (blocks.length === 0) {
      return res
        .status(200)
        .json({ message: "No blocks created by this user found" });
    }
    const response = {
      count: blocks.length,
      data: blocks.map((block) => {
        return {
          description: block.description,
          name: block.name,
          icon: block.icon,
          id: block.id,
          request: {
            type: "GET",
            url: "http://localhost:3000/api/block/" + block.id,
          },
        };
      }),
    };
    return res.status(200).json(response);
  }
  async getbyCategory(req, res) {
    try {
      const { categoryId } = req.params;
      const blocks = await Block.findAll({
        where: {
          categoryId,
        },
      });
      if (blocks.length === 0) {
        return res.status(200).json({ message: "No blocks found" });
      }
      const response = {
        count: blocks.length,
        data: blocks.map((block) => {
          return {
            description: block.description,
            icon: block.icon,
            id: block.id,
            name: block.name,
            request: {
              type: "GET",
              url: "http://localhost:3000/api/block/" + block.id,
            },
          };
        }),
      };
      return res.status(200).json(response);
    } catch (e) {
      next(badRequest(e.message));
    }
  }

  async updateItem(req, res, next) {
    try {
      let { description, icon, userId, color, id, categoryId, name } = req.body;

      const [updated] = await Block.update(
        {
          description,
          icon,
          userId,
          color,
          categoryId,
          name,
        },
        {
          where: {
            id,
          },
        }
      );

      if (updated === 0) {
        return res.status(404).send({ error: "Block not found" });
      }
      const response = {
        data: updated,
        request: {
          type: "GET",
          url: "http://localhost:3000/api/block/" + id,
        },
      };
      return res.status(200).json(response);
    } catch (e) {
      next(badRequest(e.message));
    }
  // }
  // async getViewedBlocksByUserId(req, res) {
  //   try {
  //     const { id } = req.params;
  //     const user = await User.findByPk(id, {
  //       include: { model: Block, as: "viewedBlocks" },
  //     });
  //     console.log(user);
  //     return user
  //       ? res.status(200).json({ data: user.viewedBlocks })
  //       : res.status(404).json({ error: "User not found" });
  //   } catch (e) {
  //     res.status(500).json({ error: e.message });
  //   }
  // }

  // async addBlockToViewed(req, res) {
  //   try {
  //     const { userId, blockId } = req.body;
  //     if (!userId || !blockId) {
  //       return res
  //         .status(400)
  //         .json({ error: "UserId and BlockId are required" });
  //     }

  //     // Поиск пользователя и блока, чтобы убедиться, что они существуют
  //     const user = await User.findByPk(userId);
  //     const block = await Block.findByPk(blockId);

  //     if (!user || !block) {
  //       return res.status(404).json({ error: "User or Block not found" });
  //     }

  //     // Добавление пользователя в группу
  //     await user.addBlock(block);

  //     return res
  //       .status(200)
  //       .json({ message: `Block ${blockId} added to User ${userId} ` });
  //   } catch (e) {
  //     res.status(500).json({ error: e.message });
  //   }
  }
  async findBlockByName(req, res) {
    try {
        const { name } = req.params; // Expect the block name to be passed as a URL parameter
        const block = await Block.findOne({
            where: { name } // Find a block where the name matches the provided name
        });

        if (!block) {
            return res.status(404).json({ error: "Block not found" });
        }

        const response = {
            data: block,
        };

        return res.status(200).json(response);
    } catch (e) {
        next(badRequest(e.message)); 
    }
}

}

module.exports = new blockController();
