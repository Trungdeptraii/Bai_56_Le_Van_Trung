const model = require('../models/index.js');
const {object, string} = require("yup");
const Service = require('../services/user.service.js');
const bcrypt = require('bcrypt');
let token = 'serect_123';

const Controller  = {
    login: (req, res)=>{
        let msg = req.flash("msg")
        res.render("users/login", {req, msg: msg? msg: []});
    },
    index:async (req, res)=>{
        let name = req.flash("name")
        res.render("users/index", {name: name? name: ''});
    },
    handleLogin: async(req, res)=>{
        const schema = object({
            email: string().required("Vui lòng nhập email").email("Không đúng định dạng email"),
            password: string().required("Vui lòng nhập password")
        })
        console.log('login');
        try {
            const user = await schema.validate(req.body, {abortEarly: false});
            if(!await Service.checkLogin(user)){
                req.flash('msg', 'Email hoặc mật khẩu chưa chính xác');
                return res.redirect('/dang-nhap');
            }
            const {email} = req.body;
            const name = email.slice(0, email.indexOf('@'));
            res.cookie('name', name);
            res.cookie('token', bcrypt.hashSync(token, 5))
            res.redirect('/')
        } catch (e) {
            const errors = Object.fromEntries(
                e.inner.map((item)=>[
                    item.path, item.message
                ])
            );
            req.flash('errors', errors);
            req.flash("dataOld", req.body)
            req.flash('msg', 'Vui lòng điền đầy đủ thông tin');
            res.redirect('/dang-nhap')
        }
        
    },
    handleLogout: (req, res)=>{
        res.cookie('token',  '');
        res.cookie('name',  '');
        res.redirect("dang-nhap")
    }
}
module.exports =  Controller