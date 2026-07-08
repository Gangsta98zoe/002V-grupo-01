# 002V-grupo-01 — Infraestructura como Código II (AUY1105)

Repositorio de la Evaluación Parcial 1, consolidado para el Encargo Final.
Define una infraestructura base en AWS con Terraform y un pipeline de
automatización que analiza calidad, seguridad y conformidad del código en
cada pull request hacia `main`.

## Objetivos del repositorio
- Definir con Terraform una infraestructura mínima en AWS: VPC (10.1.0.0/16),
  subred /24, security group y una instancia EC2 `t2.micro`.
- Automatizar el análisis de calidad y seguridad del código IaC mediante
  GitHub Actions.
- Aplicar políticas de seguridad como código con Open Policy Agent (OPA) /
  Conftest.

## Definición del código Terraform
| Archivo | Contenido |
|---|---|
| `provider.tf` | Proveedor AWS (`~> 6.0`), región `us-east-1` |
| `main.tf` | VPC, subred, security group (SSH restringido a la red interna) y EC2 `t2.micro` |

Nomenclatura de recursos: `002V-duocapp-<tipo>` (ej: `002V-duocapp-vpc`).

## Pipeline de automatización (CI)
Se ejecuta en cada pull request hacia `main`:

| Workflow | Etapas | Efecto |
|---|---|---|
| `terraform-validate.yml` | 1. Análisis estático (TFLint) → 2. Análisis de seguridad (Checkov) → 3. `terraform validate` | Etapas 1 y 3 bloquean el merge si fallan; Checkov es informativo |
| `opa.yml` | Políticas OPA con Conftest sobre los `.tf` | Bloquea el merge si una política se viola |

## Políticas de seguridad como código (`policies/`)
| Política | Regla |
|---|---|
| `no_public_ssh.rego` | Deniega ingreso SSH (puerto 22) con origen `0.0.0.0/0` |
| `only_t2_micro.rego` | Solo permite instancias EC2 de tipo `t2.micro` |

Ejecución local:
```bash
conftest test -p policies/ *.tf
```

## Uso básico
```bash
terraform init
terraform plan
terraform apply   # requiere credenciales AWS (Learner Lab)
terraform destroy # siempre al terminar la sesión de laboratorio
```

## Flujo de trabajo
Ramas `dev` → `qa` → `main`. Todo cambio entra por pull request; el pipeline
de CI y las políticas OPA actúan como sistema de permisos automatizado que
aprueba o rechaza los cambios propuestos.
