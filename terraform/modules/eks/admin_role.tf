
data "aws_caller_identity" "current" {}

# Who is allowed to assume this role?
# For now: the identity running Terraform (your AWS CLI identity).
resource "aws_iam_role" "platform_admin" {
  name = coalesce(var.admin_role_name, "${var.cluster_name}-platform-admin-role")

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCurrentIdentityToAssume"
        Effect = "Allow"
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Optional but recommended: require MFA for humans (enterprise pattern)
# If you don't use MFA yet, comment this block out for now.
/* 
resource "aws_iam_role_policy" "platform_admin_require_mfa" {
  name = "require-mfa"
  role = aws_iam_role.platform_admin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "DenyWithoutMFA"
        Effect   = "Deny"
        Action   = "*"
        Resource = "*"
        Condition = {
          BoolIfExists = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
} 
*/
