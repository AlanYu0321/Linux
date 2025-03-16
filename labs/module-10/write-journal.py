from cysystemd import journal

journal.write("Hello Lennart")

# Or send structured data
journal.send(
    message="Hello Lennart",
    priority=journal.Priority.INFO,
    some_field='some value',
)
