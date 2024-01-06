const model = require('../models/index.js');
const customer = model.Customer;
const { Op } = require("sequelize");
const bcrypt = require('bcrypt');

const Service = {
    checkLogin: async ({email, password})=>{
        let filter = {
            where: {
                email: {
                    [Op.eq]: email
                }
            }
        };
        try {
            let user =  await customer.findAll(filter);
            if(!user.length){
                return false
            }
            const checkpass = await bcrypt.compare(password, user[0].password);
            return checkpass ? true : false
        } catch (error) {
            return false
        }
    }
}

module.exports = Service