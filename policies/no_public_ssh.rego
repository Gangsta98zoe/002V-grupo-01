package main

# Política 1 (EA1 - requerimiento 4): no permitir acceso SSH público.
# Deniega cualquier regla de ingreso al puerto 22 cuyo origen sea 0.0.0.0/0,
# sin importar en qué recurso o nivel de anidamiento se declare.
deny[msg] {
	walk(input, [_, value])
	is_object(value)
	value.from_port == 22
	value.cidr_blocks[_] == "0.0.0.0/0"
	msg := "POLITICA VIOLADA (no_public_ssh): regla de ingreso SSH (puerto 22) abierta a 0.0.0.0/0; restrinja el CIDR de origen"
}
