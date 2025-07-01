# Questo file crea la distribuzione CloudFront che funge da CDN e bilanciatore di carico.

# 1. Crea un'Origin Access Identity (OAI) per CloudFront.
# Questa identità è necessaria per permettere a CloudFront di accedere al bucket S3 in modo sicuro.
resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI per il bucket del sito statico S3"
}

# 2. Crea la policy del bucket per consentire l'accesso solo all'OAI di CloudFront.
resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  bucket = aws_s3_bucket.static_site_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.oai.id}"
        },
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static_site_bucket.arn}/*"
      }
    ]
  })
}

# 3. Crea la distribuzione CloudFront.
resource "aws_cloudfront_distribution" "static_site_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_site_bucket.bucket_regional_domain_name
    origin_id   = "S3-${aws_s3_bucket.static_site_bucket.id}"

    # Collega l'OAI per l'accesso sicuro.
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  # Comportamento di default per il caching.
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${aws_s3_bucket.static_site_bucket.id}"
    
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none" # Accesso da tutte le posizioni
    }
  }

  # Utilizza il certificato SSL predefinito di CloudFront.
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Project = var.project_name
  }
}