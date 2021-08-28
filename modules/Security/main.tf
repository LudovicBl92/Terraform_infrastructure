resource "aws_security_group" "first_sg" {
    name = var.first_sg
    description = var.first_sg
    vpc_id = var.id_vpc

    tags = {
        Name = var.first_sg
    }
}

resource "aws_security_group" "second_sg" {
    name = var.second_sg
    description = var.second_sg
    vpc_id = var.id_vpc

    tags = {
        Name = var.second_sg
    }
}

resource "aws_security_group_rule" "ingress_rules_Pub" {
    count = length(var.ingress_rules_Pub)

    type              = "ingress"
    from_port         = var.ingress_rules_Pub[count.index].from_port
    to_port           = var.ingress_rules_Pub[count.index].to_port
    protocol          = var.ingress_rules_Pub[count.index].protocol
    cidr_blocks       = [var.ingress_rules_Pub[count.index].cidr_block]
    description       = var.ingress_rules_Pub[count.index].description
    security_group_id = aws_security_group.first_sg.id
}

resource "aws_security_group_rule" "egress_rules_Pub" {
    count = length(var.ingress_rules_Pub)

    type              = "egress"
    from_port         = var.egress_rules_Pub[count.index].from_port
    to_port           = var.egress_rules_Pub[count.index].to_port
    protocol          = var.egress_rules_Pub[count.index].protocol
    cidr_blocks       = [var.egress_rules_Pub[count.index].cidr_block]
    description       = var.egress_rules_Pub[count.index].description
    security_group_id = aws_security_group.first_sg.id
}

resource "aws_security_group_rule" "ingress_rules_NAT" {
    count = length(var.ingress_rules_NAT)

    type              = "ingress"
    from_port         = var.ingress_rules_NAT[count.index].from_port
    to_port           = var.ingress_rules_NAT[count.index].to_port
    protocol          = var.ingress_rules_NAT[count.index].protocol
    cidr_blocks       = [var.cidr_block_subnet1]
    description       = var.ingress_rules_NAT[count.index].description
    security_group_id = aws_security_group.second_sg.id
}

resource "aws_security_group_rule" "egress_rules_NAT" {
    count = length(var.egress_rules_NAT)

    type              = "egress"
    from_port         = var.egress_rules_NAT[count.index].from_port
    to_port           = var.egress_rules_NAT[count.index].to_port
    protocol          = var.egress_rules_NAT[count.index].protocol
    cidr_blocks       = [var.egress_rules_NAT[count.index].cidr_block]
    description       = var.egress_rules_NAT[count.index].description
    security_group_id = aws_security_group.second_sg.id
}