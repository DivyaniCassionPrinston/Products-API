// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Product record {|
    readonly int id;
    string name;
    string? description;
    string? coverageType;
    decimal? coverageAmount;
    decimal? deductible;
    string? premium;
|};

public type ProductOptionalized record {|
    int id?;
    string name?;
    string? description?;
    string? coverageType?;
    decimal? coverageAmount?;
    decimal? deductible?;
    string? premium?;
|};

public type ProductTargetType typedesc<ProductOptionalized>;

public type ProductInsert record {|
    string name;
    string? description;
    string? coverageType;
    decimal? coverageAmount;
    decimal? deductible;
    string? premium;
|};

public type ProductUpdate record {|
    string name?;
    string? description?;
    string? coverageType?;
    decimal? coverageAmount?;
    decimal? deductible?;
    string? premium?;
|};

