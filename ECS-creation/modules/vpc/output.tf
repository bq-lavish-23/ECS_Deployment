
output "subnet-id-public" {
  value = aws_subnet.subnet-public.id
}
output "subnet-id-private-1" {
  value = aws_subnet.subnet-private-1.id
}
output "subnet-id-private-2" {
  value = aws_subnet.subnet-private-2.id
}
output "vpc-id" {
  value = aws_vpc.vpc.id
}
