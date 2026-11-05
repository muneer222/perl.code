# Must return a reference to a data structure
{
    database => "production_db",
    username => "admin",
    port     => 5432,
    features => [ 'auth', 'logging', 'metrics' ],
    user => {
        name => 'Alice',
        email => 'alice@example.com',
        role => 'Admin',
    }
}
