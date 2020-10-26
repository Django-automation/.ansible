resource "aws_dynamodb_table" "terraform_state_lock" {
    hash_key = "LockID"
    read_capacity = 10
    write_capacity = 10
    name = "notejam-state-lock"
    attribute {
        name = "LockID"
        type = "S"
    }
}
