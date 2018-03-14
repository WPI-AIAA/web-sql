# Creates a 'master' SQL Script by combining individual scripts

# Lists of file names for each category
tables = []
triggers = []
test = []

# Tables
tables.append("./tables/students.sql")
tables.append("./tables/locations.sql")
# Depends on students & locations
tables.append("./tables/student_permissions.sql") 
tables.append("./tables/student_locations.sql")
tables.append("./tables/activity_logs.sql")

# Test

# Triggers
triggers.append("./triggers/activity_logs.sql")