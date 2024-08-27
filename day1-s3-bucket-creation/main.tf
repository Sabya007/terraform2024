resource "aws_s3_bucket" "dev" {
    bucket = "kutukutu"
  
}

# Upload a file to the S3 bucket
resource "aws_s3_object" "git" {
  bucket = "kutukutu"
  key    = "gitfinaldoc"  # The object key (name of the file in S3)

  # Path to the file you want to upload
  source = "C:/Users/52036970/terraform2024/gitfinaldoc.docx"  # Replace with the path to your local file

  # Content-Type for the file (optional)
  content_type = "text/plain"
}