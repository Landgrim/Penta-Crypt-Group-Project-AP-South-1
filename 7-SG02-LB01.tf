resource "aws_security_group" "PentaCryptapp1_sg02_LB01" {
  name        = "PentaCryptapp1_sg02_LB01"
  description = "PentaCryptapp1_sg02_LB01"
  vpc_id      = aws_vpc.PentaCryptapp1.id 

  
  ingress {
    description      = "LBExternal"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name    = "PentaCryptapp1"
    Service = "Application1"
    Owner   = "Interoyal"
    Planet  = "Global"
  }
}




