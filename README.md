# DevOps Challenge – Parte 1

Este repositorio contiene la infraestructura inicial del desafío técnico para una posición DevOps. 

---

## 📦 Estructura actual

```bash
DEVOPS-SENIOR-CHALLENGE-1/
├── backend.tf                # Configuración del backend remoto en S3
├── main.tf                   # Inclusión del módulo de S3
├── outputs.tf                # Variables de salida
├── variables.tf              # Definición de variables
├── .terraform/               # Archivos generados por Terraform (ignorado)
├── terraform.tfstate*        # Archivo de estado (ignorado)
├── s3/                       # Módulo interno: bucket S3 con bloqueo público
│   ├── s3.tf
│   ├── outputs.tf
└── README.md                 # Este archivo
```

---

## 🔧 Funcionalidad actual

- ✅ Bucket S3 creado con:
  - Bloqueo de acceso público
  - Versionado habilitado
  - Eliminación forzada (`force_destroy`) para entornos de prueba
- ✅ Estado de Terraform almacenado remotamente en el bucket
- 🔜 Locking **no implementado aún** (sin tabla DynamoDB)

---

## 🚀 Próximos pasos

1. [ ] Implementar DynamoDB para locking remoto
2. [ ] Crear VPC mediante módulo oficial
3. [ ] Desplegar EKS y balanceador de carga
4. [ ] Agregar bucket adicional privado para almacenamiento general
5. [ ] Automatizar provisión con scripts y CI/CD (Partes 2 y 3 del challenge)

---

## ⚙️ Requisitos

- Terraform >= 1.3.0
- AWS CLI configurado
- Acceso a cuenta de AWS

---

## 📁 Estado del proyecto

Documentación técnica detallada del paso a paso y decisiones tomadas se mantiene en un canal externo.
