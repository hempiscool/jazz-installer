data "aws_vpc" "vpc_data" {
  filter {
    name   = "tag:Name"
    values = ["${var.envPrefix}"]
  }
}

data "aws_eip" "eip_data" {
  filter {
    name   = "tag:Name"
    values = ["${var.envPrefix}"]
  }
}

data "external" "instance_ip" {
  program = ["bash", "-c", "echo \"{\\\"ip\\\" : \\\"$(curl -s  checkip.amazonaws.com)\\\"}\""]
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.vpc_data.id}"

  tags = {
    Tier = "Private"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.vpc_data.id}"

  tags = {
    Tier = "Public"
  }
}

resource "aws_security_group" "vpc_sg" {
    name = "${var.envPrefix}_dockerized_tvault_sg"
    description = "ECS ALB access - Tvault"
    vpc_id = "${data.aws_vpc.vpc_data.id}"
    ingress {
        from_port = "${var.tvault_port1}"
        to_port = "${var.tvault_port1}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.tvault_port1}"
        to_port = "${var.tvault_port1}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.tvault_port2}"
        to_port = "${var.tvault_port2}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.tvault_port2}"
        to_port = "${var.tvault_port2}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.tvault_port3}"
        to_port = "${var.tvault_port3}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.tvault_port3}"
        to_port = "${var.tvault_port3}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = "${local.common_tags}"
}

resource "aws_security_group" "vpc_sg_consul" {
    name = "${var.envPrefix}_dockerized_consul_sg"
    description = "ECS ALB access - Consul"
    vpc_id = "${data.aws_vpc.vpc_data.id}"
    ingress {
        from_port = "${var.consul_port1}"
        to_port = "${var.consul_port1}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port1}"
        to_port = "${var.consul_port1}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port2}"
        to_port = "${var.consul_port2}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port2}"
        to_port = "${var.consul_port2}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port3}"
        to_port = "${var.consul_port3}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port3}"
        to_port = "${var.consul_port3}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port4}"
        to_port = "${var.consul_port4}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port4}"
        to_port = "${var.consul_port4}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port5}"
        to_port = "${var.consul_port5}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port5}"
        to_port = "${var.consul_port5}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port6}"
        to_port = "${var.consul_port6}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port6}"
        to_port = "${var.consul_port6}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port7}"
        to_port = "${var.consul_port7}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port7}"
        to_port = "${var.consul_port7}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }
    ingress {
        from_port = "${var.consul_port8}"
        to_port = "${var.consul_port8}"
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = "${var.consul_port8}"
        to_port = "${var.consul_port8}"
        protocol = "tcp"
        cidr_blocks = ["${concat(list("${data.aws_eip.eip_data.public_ip}/32"), list("${data.external.instance_ip.result.ip}/32"), split(",", var.network_range))}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = "${local.common_tags}"
}
