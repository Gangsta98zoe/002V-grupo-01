# 002V-grupo-01
Repositorio correspondiente a Ev Parcial 1 Infra Cloud II
main
# AUY1105 - Infraestructura como Código II
## Evaluación Parcial 1: Automatización análisis de calidad y seguridad

## Descripción

## Recursos Terraform Implementados

### 1. Virtual Private Cloud (VPC)
- **CIDR Block:** 10.1.0.0/16
- **Nombre:** 002V-duocapp-vpc

### 2. Subred Pública
- **CIDR Block:** 10.1.1.0/24
- **Zona:** us-east-1a
- **Nombre:** 002V-duocapp-subnet

### 3. Security Group
- **Nombre:** 002V-duocapp-sg
- **SSH:** 0.0.0.0/0
- **Egress:** Permitir todo

### 4. Instancia EC2
- **Nombre:** 002V-duocapp-ec2
- **Tipo:** t2.micro
- **AMI:** ami-05b10e08d247fb927
- **Ubicación:** Subred pública

---

## Herramientas de Análisis Integradas

### TFLint
- Análisis estático del código Terraform
- Detecta errores y mejores prácticas
- Ejecución: `tflint`

### Checkov
- Análisis de seguridad y vulnerabilidades
- Validación de políticas de conformidad
- Ejecución: `checkov -d . --framework terraform`

### OPA (Open Policy Agent)
- Políticas personalizadas mediante archivos .rego
- Política 1: no_public_ssh.rego - Rechaza SSH público (0.0.0.0/0)
- Política 2: only_t2_micro.rego - Solo permite t2.micro
- Ejecución: `conftest test -p policies/ *.tf`

### Terraform Validate
- Validación de sintaxis y estructura
- Ejecución: `terraform validate`

---

## Git Logs en CHANGELOG

El proyecto integra git logs en CHANGELOG.md para documentar todos los cambios realizados:

```bash
git log --oneline --decorate
```

Cada commit registra:
- Nuevas features agregadas
- Cambios en infraestructura
- Correcciones de seguridad
- Actualizaciones de políticas

---

## Estructura

```
AUY1105-grupo-002V/
├── .github/workflows/
│   ├── terraform-validate.yml
│   └── opa-validation.yml
├── policies/
│   ├── no_public_ssh.rego
│   └── only_t2_micro.rego
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── .gitignore
├── README.md
└── CHANGELOG.md
```

---

**Última actualización:** [15/04/2026]
**Versión:** 1.0.0

=======
hola mundo
dev
