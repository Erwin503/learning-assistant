const { Schedule, User, Block, Group } = require('../models/models');

class ScheduleController {
  static async create(req, res) {
    try {
      const { startTime, endTime, dayOfWeek, userId, blockId, groupId } = req.body;
      const newSchedule = await Schedule.create({ startTime, endTime, dayOfWeek, userId, blockId, groupId });
      res.status(201).json({ data: newSchedule });
    } catch (error) {
      console.error('Error creating schedule:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async getAll(req, res) {
    try {
      const schedules = await Schedule.findAll();
      res.status(200).json({ data: schedules });
    } catch (error) {
      console.error('Error fetching schedules:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async getOne(req, res) {
    try {
      const { id } = req.params;
      const schedule = await Schedule.findByPk(id);
      if (!schedule) {
        return res.status(404).json({ error: 'Schedule not found' });
      }
      res.status(200).json({ data: schedule });
    } catch (error) {
      console.error('Error fetching schedule:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async updateItem(req, res) {
    try {
      const { id } = req.params;
      const { startTime, endTime, dayOfWeek, userId, blockId, groupId } = req.body;
      const [updated] = await Schedule.update({ startTime, endTime, dayOfWeek, userId, blockId, groupId }, { where: { id } });
      if (!updated) {
        return res.status(404).json({ error: 'Schedule not found' });
      }
      const updatedSchedule = await Schedule.findByPk(id);
      res.status(200).json({ data: updatedSchedule });
    } catch (error) {
      console.error('Error updating schedule:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async deleteItem(req, res) {
    try {
      const { id } = req.params;
      const deleted = await Schedule.destroy({ where: { id } });
      if (!deleted) {
        return res.status(404).json({ error: 'Schedule not found' });
      }
      res.status(200).json({ message: 'Schedule deleted successfully' });
    } catch (error) {
      console.error('Error deleting schedule:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async getSchedulesByUserId(req, res) {
    try {
      const { userId } = req.params;
      const schedules = await Schedule.findAll({ where: { userId } });
      res.status(200).json({ data: schedules });
    } catch (error) {
      console.error('Error fetching schedules for user:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

  static async getSchedulesByGroupId(req, res) {
    try {
      const { groupId } = req.params;
      const schedules = await Schedule.findAll({ where: { groupId } });
      res.status(200).json({ data: schedules });
    } catch (error) {
      console.error('Error fetching schedules for group:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }
}

module.exports = ScheduleController;
