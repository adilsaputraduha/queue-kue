const axios = require("axios");
const kue = require("kue");
const queue = kue.createQueue();

const db = require("../models");
const Product = db.products;

module.exports = {
    async getOrder(req, res) {
        const doTest = async (idx) => {
            const { data } = await axios.post("http://localhost:8081/order-process", {
                items: [
                    {
                        id: 6, //id produk
                        item: 2, //jumlah produk yg dibeli
                        total: 35000, //total harga
                    },
                    {
                        id: 5,
                        item: 2,
                        total: 26000,
                    },
                ],
            });
            console.log(`Transaction id #${idx}`, data);
        };
        Promise.all([doTest(1), doTest(2), doTest(3), doTest(4)]);
    },
    async processOrder(req, res) {
        const job = queue.create("order", {
            items: req.body.items,
        });
        job.on("failed", (err) => {
            console.log(err);
        });
        job.on("complete", (result) => {
            console.log(result);
        });
        job.save();
        return res.json("Wait the queue please :)");
    },
};

queue.process("order", async (job, done) => {
    try {
        let outOfStock = {
            bool: false,
            data: [],
        };
        let allProduct = (
            await Product.findAll({
                where: {
                    id: job.data.items.map((el) => el.id)
                },
                attributes: ["id", "stock"],
            })
        ).map((el) => {
            if (el.stock < job.data.items.find((inner) => inner.id === el.id).item) {
                outOfStock.bool = true;
                outOfStock.data.push(el);
            }
            return {
                id: el.id,
                stock: el.stock,
            };
        });

        if (outOfStock.bool) {
            return done(
                JSON.stringify({
                    errorMsg: "Stok Habis Woi!",
                    data: outOfStock.data,
                })
            );
        }

        await Promise.all(
            allProduct.map((el) => {
                return Product.update(
                    {
                        stock: el.stock - job.data.items.find((inner) => inner.id === el.id).item,
                    },
                    {
                        where: {
                            id: el.id,
                        },
                    }
                );
            })
        );
        done(null, "ok");
    } catch (err) {
        done(err);
    }
});
