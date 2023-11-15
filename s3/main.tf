resource "aws_s3_bucket" "kuyesura" {
  bucket = "kuyesura-s3"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "acer" {
  bucket = "kuyesura-acer-s3"

  tags = {
    Name        = "Acer bucket"
    Environment = "Dev"
  }
}