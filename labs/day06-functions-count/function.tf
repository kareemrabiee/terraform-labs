resource "aws_iam_user" "test" {
  name = "test-user"
}

resource "aws_iam_user_policy" "test-policy" {
  name = "test-policy"
  user = aws_iam_user.test.name
  policy = file("./iam-user-policy.json")
  
}