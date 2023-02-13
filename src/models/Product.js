module.exports = (sequelize, Sequelize) => {
    const Product = sequelize.define("products", {
        nama: {
            type: Sequelize.STRING,
        },
        harga: {
            type: Sequelize.INTEGER,
        },
        stock: {
            type: Sequelize.INTEGER,
        },
        userId: {
            type: Sequelize.INTEGER,
        },
        photoUrl: {
            type: Sequelize.STRING,
        },
    });

    return Product;
};
