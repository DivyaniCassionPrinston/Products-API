import ballerina/persist as _;
import ballerinax/persist.sql;

@sql:Name {value: "products"}
public type Product record {|
    @sql:Generated
    readonly int id;
    @sql:Varchar {length: 255}
    string name;
    string? description;
    @sql:Name {value: "coverage_type"}
    @sql:Varchar {length: 100}
    string? coverageType;
    @sql:Name {value: "coverage_amount"}
    @sql:Decimal {precision: [15, 2]}
    decimal? coverageAmount;
    @sql:Decimal {precision: [15, 2]}
    decimal? deductible;
    @sql:Varchar {length: 50}
    string? premium;
|};

