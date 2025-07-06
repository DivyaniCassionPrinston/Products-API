import products_api.db;

import ballerina/graphql;

final db:Client dbClient = check new db:Client();

@graphql:ServiceConfig {
    graphiql: {enabled: true}
}
service /insurance on new graphql:Listener(9091) {

    resource function get all() returns db:Product[]|error {
        stream<db:Product, error?> productStream = dbClient->/products;
        db:Product[] products = [];

        check from db:Product product in productStream
            do {
                products.push(product);
            };

        return products;
    }

    resource function get filterByCoverageType(string coverageType) returns db:Product[]|error {
        stream<db:Product, error?> productStream = dbClient->/products.get(whereClause = `coverage_type = ${coverageType}`);
        db:Product[] products = [];

        check from db:Product product in productStream
            do {
                products.push(product);
            };

        return products;
    }

    resource function get getProductById(int id) returns db:Product|error {
        db:Product product = check dbClient->/products/[id];
        return product;
    }

    remote function add(db:ProductInsert product) returns db:Product|error {
        int[] ids = check dbClient->/products.post([product]);

        if ids.length() == 0 {
            return error("Failed to create product");
        }

        db:Product insertedProduct = check dbClient->/products/[ids[0]];
        return insertedProduct;
    }

    remote function update(int id, db:ProductUpdate product) returns db:Product|error {
        db:Product updatedProduct = check dbClient->/products/[id].put(product);
        return updatedProduct;
    }

    remote function delete(int id) returns db:Product|error {
        db:Product deletedProduct = check dbClient->/products/[id].delete();
        return deletedProduct;
    }

    function beforeExit() returns error? {
        check dbClient.close();
    }
}
