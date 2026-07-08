package main

# Política 2 (EA1 - requerimiento 4): solo se permite crear instancias EC2
# de tipo t2.micro (límite del entorno académico AWS Learner Lab).
deny[msg] {
	instance := input.resource.aws_instance[name]
	instance.instance_type != "t2.micro"
	msg := sprintf("POLITICA VIOLADA (only_t2_micro): la instancia '%v' usa el tipo '%v'; solo se permite t2.micro", [name, instance.instance_type])
}
