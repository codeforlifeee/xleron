# JSON Filter and Sort Task

You are given a JSON file located at `/app/users.json` containing a list of user records.

## Task

1. Read the JSON file at `/app/users.json`
2. Filter the users to include only those who are 18 years old or older (age >= 18)
3. Sort the filtered users alphabetically by their name (ascending order)
4. Write the result to `/app/output.json`

## Input Format

The input file `/app/users.json` contains a JSON array of user objects. Each user has:
- `name`: string (user's full name)
- `age`: integer (user's age)
- `email`: string (user's email address)

Example:
```json
[
  {"name": "Alice", "age": 25, "email": "alice@example.com"},
  {"name": "Bob", "age": 17, "email": "bob@example.com"},
  {"name": "Charlie", "age": 30, "email": "charlie@example.com"}
]
```

## Output Format

The output file `/app/output.json` should contain a JSON array with:
- Only users with age >= 18
- Sorted alphabetically by name
- Same structure as input (name, age, email fields)

For the example above, the output should be:
```json
[
  {"name": "Alice", "age": 25, "email": "alice@example.com"},
  {"name": "Charlie", "age": 30, "email": "charlie@example.com"}
]
```

## Requirements

- Use absolute paths: `/app/users.json` and `/app/output.json`
- Output must be valid JSON
- Preserve all fields (name, age, email) in the output
- Ensure proper JSON formatting
