# Products API

This is a GraphQL API for insurance products built with Ballerina persistence layer.

## Getting Started

### Prerequisites

1. Ballerina Swan Lake 2201.12.3 or later
2. MySQL database server
3. Configure your database details in `Config.toml`

### Database Setup

1. Create a database named `insurance_db` in your MySQL server
2. Execute the SQL script found in `modules/db/script.sql` to create the required tables

```bash
mysql -u root -p insurance_db < modules/db/script.sql
```

### Running the Application

```bash
bal run
```

The GraphQL service will start on port 9091, and you can access the GraphiQL interface at:
http://localhost:9091/insurance/graphiql

## GraphQL Queries and Mutations

### Queries

1. Get all products:

```graphql
query {
  all {
    id
    name
    description
    coverageType
    coverageAmount
    deductible
    premium
  }
}
```

2. Get product by ID:

```graphql
query {
  getProductById(id: 1) {
    id
    name
    description
    coverageType
    coverageAmount
    deductible
    premium
  }
}
```

3. Filter products by coverage type:

```graphql
query {
  filterByCoverageType(coverageType: "Health") {
    id
    name
    description
    coverageAmount
    deductible
    premium
  }
}
```

### Mutations

1. Add a new product:

```graphql
mutation {
  add(
    product: {
      name: "Health Insurance Plus"
      description: "Comprehensive health coverage"
      coverageType: "Health"
      coverageAmount: 500000
      deductible: 1000
      premium: "100/month"
    }
  ) {
    id
    name
    description
  }
}
```

2. Update an existing product:

```graphql
mutation {
  update(id: 1, product: { premium: "120/month", coverageAmount: 600000 }) {
    id
    name
    premium
    coverageAmount
  }
}
```

3. Delete a product:

```graphql
mutation {
  delete(id: 1) {
    id
    name
  }
}
```

## Note on GraphQL to Persistence Mapping

The GraphQL service automatically maps to the persistence layer's database operations:

- GraphQL queries -> DB read operations
- GraphQL mutations -> DB create/update/delete operations
