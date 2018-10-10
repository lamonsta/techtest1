resource "aws_lb" "lf-alb-1" {
  name               = "lf-alb-1"
  internal           = false
  load_balancer_type = "application"
  security_groups     = ["${aws_security_group.allow_http.id}"]
  subnets            = ["${aws_subnet.private_subnet_1.id}", "${aws_subnet.private_subnet_2.id}"]



  tags {
    Environment = "Tech Test ALB Private Subbets 1 and 2"
  }
}
