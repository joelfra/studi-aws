
#outputs.tf
output "db_instance_endpoint" {
  value       = aws_db_instance.myrds.endpoint
}

output "alb_public_url" {
  description = "Public URL for Application Load Balancer"
  value       = aws_lb.lb.dns_name
}