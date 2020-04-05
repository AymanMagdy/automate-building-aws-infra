resource "aws_route_table_association" "associate_private_subnet1_route_table"{
    subnet_id = "${aws_subnet.private_subnet1.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "associate_private_subnet2_route_table"{
    subnet_id = "${aws_subnet.private_subnet2.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}