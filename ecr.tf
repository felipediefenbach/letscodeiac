resource "aws_ecr_repository" "frontend" {
  name = "frontend"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}
resource "aws_ecr_repository" "backend" {
  name = "backend"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}

output "urlRepoFrontend" {
  value = aws_ecr_repository.frontend.repository_url
}

output "urlRepobackend" {
  value = aws_ecr_repository.backend.repository_url
}