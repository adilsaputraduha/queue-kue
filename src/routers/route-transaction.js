const router = require('express').Router();
const { transaction } = require('../controllers');

router.get('/order', transaction.getOrder);
router.post('/order-process', transaction.processOrder);

module.exports = router;