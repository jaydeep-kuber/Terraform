resource "aws_s3_bucket" "my_bucket" {
  bucket = "your-unique-bucket-name-12345" # Ensure this name is globally unique
  tags = {
    Name        = "tf.Bucket"
    Environment = "test"
  }
}