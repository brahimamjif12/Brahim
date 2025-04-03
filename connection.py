import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="root",
    database="fiber_network"
)

cursor = conn.cursor()

# Create tables
cursor.execute("""
CREATE TABLE IF NOT EXISTS STRUCTURE (
    structure_id INT AUTO_INCREMENT PRIMARY KEY,
    structure_name VARCHAR(255) NOT NULL
);
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS CARD (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    card_type VARCHAR(50),
    fiber_id VARCHAR(50),
    structure_id INT,
    FOREIGN KEY (structure_id) REFERENCES STRUCTURE(structure_id)
);
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS FIBER_CONNECTIONS (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    from_fiber VARCHAR(50),
    to_fiber VARCHAR(50),
    status ENUM('ACTIVE', 'INACTIVE') NOT NULL
);
""")

# Insert sample data
cursor.execute("INSERT INTO STRUCTURE (structure_name) VALUES (%s)", ("Central Rack A",))
structure_id = cursor.lastrowid

cursor.execute("INSERT INTO CARD (card_type, fiber_id, structure_id) VALUES (%s, %s, %s)", ("Input", "Fiber001", structure_id))
cursor.execute("INSERT INTO CARD (card_type, fiber_id, structure_id) VALUES (%s, %s, %s)", ("Output", "Fiber002", structure_id))

cursor.execute("INSERT INTO FIBER_CONNECTIONS (from_fiber, to_fiber, status) VALUES (%s, %s, %s)", ("Fiber001", "Fiber002", "ACTIVE"))
conn.commit()

# Display cards in structure
print("Cards in Central Rack A:")
cursor.execute("""
SELECT c.card_id, c.card_type, s.structure_name
FROM CARD c
JOIN STRUCTURE s ON c.structure_id = s.structure_id
""")
for row in cursor.fetchall():
    print(row)

# Show active connections
print("\nActive Fiber Connections:")
cursor.execute("""
SELECT fc.connection_id, c1.card_type AS from_card, c2.card_type AS to_card
FROM FIBER_CONNECTIONS fc
JOIN CARD c1 ON fc.from_fiber = c1.fiber_id
JOIN CARD c2 ON fc.to_fiber = c2.fiber_id
WHERE fc.status = 'ACTIVE'
""")
for row in cursor.fetchall():
    print(row)

# Update connection status
cursor.execute("UPDATE FIBER_CONNECTIONS SET status = 'INACTIVE' WHERE connection_id = 1")
conn.commit()

# Confirm update
print("\nUpdated Connections:")
cursor.execute("SELECT * FROM FIBER_CONNECTIONS")
for row in cursor.fetchall():
    print(row)

# Close the connection
conn.close()
