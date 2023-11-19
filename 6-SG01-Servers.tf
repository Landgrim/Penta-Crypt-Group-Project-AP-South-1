resource "aws_security_group" "PentaCryptapp1-sg01-servers" {
  name        = "PentaCryptapp1-sg01-servers"
  description = "PentaCryptapp1-sg01-servers"
  vpc_id      = aws_vpc.PentaCryptapp1.id 

  
  ingress {
    description      = "HTTPMyHomePage1"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

ingress {
    description = "RDPBadBox"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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




