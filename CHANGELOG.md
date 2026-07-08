# Changelog — 002V-grupo-01

## [Consolidación Encargo Final] - 2026-07-08
### Added
- Políticas de seguridad como código en `policies/`: `no_public_ssh.rego`
  (deniega SSH abierto a 0.0.0.0/0) y `only_t2_micro.rego` (solo instancias
  t2.micro), evaluadas con Conftest/OPA en cada pull request.
- Paso `terraform init -backend=false` previo a `terraform validate` en el
  pipeline (la ETAPA 3 fallaba por falta de inicialización del proveedor).

### Changed
- `opa.yml` reescrito: se elimina texto ajeno al YAML que impedía su
  ejecución y las políticas pasan a ser bloqueantes (sin `continue-on-error`).
- `README.md` actualizado: objetivos, definición del código Terraform,
  etapas del pipeline y uso de las políticas.
- `main.tf`: la regla de ingreso SSH se restringe a la red interna
  10.1.0.0/16 en cumplimiento de la política `no_public_ssh`.

### Removed
- `checkov.yml` (workflow corrupto, duplicaba etapas de
  `terraform-validate.yml`), `terraform.yml` (plantilla de ejemplo de GitHub
  con referencia a Terraform Cloud no utilizada) y
  `.github/workflows/tfplan.json` (artefacto subido por error).

---

## Historial Evaluación Parcial 1 (abril 2026)

### git log de Servando
```
f10c2c3 se incorpora a archivo main.tf recursos de grupos de seguridad y recursos de computo EC2
cca6e27 Merge pull request #1 from Gangsta98zoe/main
e629ebe Merge branch 'main' of https://github.com/Gangsta98zoe/002V-grupo-01
4261523 Se agrega codigo main.tf base vpc + subnet
e256c21 Create CHANGELOG.md
60750ed Initial commit
```

### git log de Francisco
```
49d8bc3 Merge pull request #8 from Gangsta98zoe/qa
a5e8518 Merge pull request #7 from Gangsta98zoe/dev
d470a13 Merge pull request #6 from Gangsta98zoe/main
a41b905 Add Terraform CI workflow for GitHub Actions
bfe9fac Merge pull request #5 from Gangsta98zoe/main
b9346d9 Merge branch 'main' of https://github.com/Gangsta98zoe/002V-grupo-01
3afa148 se realiza carga de codigo provider.tf con dato de proveedor y region a utilizar
d8c94b5 Merge pull request #4 from ServandoSoto/main
70c1643 Merge pull request #2 from ServandoSoto/main
6a4e087 Merge pull request #3 from Gangsta98zoe/dev
```
