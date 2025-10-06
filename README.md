# DevOps Challenge – Parte 1

Este repositorio contiene la infraestructura inicial del desafío técnico para una posición DevOps. 

---

## 📦 Estructura actual
DEVOPS-CHALLENGE-1/
├── backend.tf                # Configuración del backend remoto (por ejemplo, S3 para estado)
├── main.tf                   # Configuración general: provider, versiones, etc.
├── variables.tf              # Todas las variables utilizadas por los recursos
├── outputs.tf                # Variables de salida (VPC ID, bucket name, etc.)
├── vpc.tf                    # Definición completa de la VPC, subnets, IGW, route tables, etc.
├── s3.tf                     # Bucket S3 + versionado + política de acceso
├── eks.tf                    # (nuevo) Definición de recursos EKS: cluster, node groups, IAM roles, etc.
└── README.md                 # Instrucciones, explicación del reto, pasos de ejecución
```

---

---

## ⚙️ Requisitos

- AWS CLI configurado
- Terraform ≥ v1.5
- Helm ≥ v3.x
- kubectl ≥ v1.27
- Permisos de IAM para desplegar recursos en AWS

---

## 🚀 Pasos para el Despliegue

1. Inicializar el proyecto:
   ```bash
   terraform init
   ```

2. Previsualizar los cambios:
   ```bash
   terraform plan
   ```

3. Aplicar el despliegue:
   ```bash
   terraform apply
   ```

4. Conectarse al clúster:
   ```bash
   aws eks update-kubeconfig --region us-east-1 --name <nombre-del-cluster>
   ```

5. Instalar el AWS Load Balancer Controller (ver documentación oficial de Helm + IRSA).

6. Aplicar el manifiesto:
   ```bash
   kubectl apply -f manifests/nginx-ingress.yaml
   ```

7. Obtener la URL pública:
   ```bash
   kubectl get ingress nginx-ingress
   ```

8. Acceder desde el navegador:  
   `http://<ALB-DNS>.amazonaws.com`

---

## ✅ Recursos creados

- 🌐 VPC con subnets públicas y privadas
- ☁️ Bucket S3 privado con política de acceso denegado a público
- 🎛️ Amazon EKS + NodeGroup (EC2 t3.small)
- 📦 Servicio NGINX expuesto mediante un ALB gestionado por Ingress

---

## 🛠️ Troubleshooting

- Asegurarse de tener las subnets etiquetadas con:
  - `"kubernetes.io/role/elb" = "1"`
  - `"kubernetes.io/cluster/your-cluster-name" = "owned"`
- Verificar IAM Role del Load Balancer Controller
- Confirmar estado de pods, services e ingress (`kubectl get all`)
- Revisar el DNS del ALB desde consola AWS

---

## 📄 Autor

Francisco Boll – [GitHub](https://github.com/franciscboll) | DevOps Engineer

---

## 📌 Notas

- El entorno fue pensado desde una perspectiva **productiva**, utilizando subnets privadas para los nodos y públicas para el balanceador.
- El bucket para `tfstate` se encuentra fuera de esta configuración como backend externo (no se incluye locking).
