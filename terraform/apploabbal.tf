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


resource "aws_route53_record" "cname_route53_record" {
  zone_id = "${aws_route53_zone.primary.zone_id}" # Replace with your zone ID
  name    = "techtest.somedomain.com" # Replace with your name/domain/subdomain
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_lb.lf-alb-1.dns_name}"]
}
