# 📘 README — Local Modules TF

## 📌 Descripción  
Este módulo crea los recursos básicos de red para una VPC:

- **Subnet**
- **Internet Gateway**
- **Route Table**
- **Route Table Association**

Está diseñado para funcionar tanto en **AWS real** como en **LocalStack**, por lo que es ideal para laboratorios, pruebas locales o entornos de desarrollo.

---

## 📁 Estructura del módulo

```
modules/
└── subnet/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

---

## 🚀 Recursos que crea

### 1. Subnet  
Crea una subred dentro de la VPC especificada.

### 2. Internet Gateway  
Permite salida a internet desde la VPC.

### 3. Route Table  
Incluye una ruta por defecto hacia el Internet Gateway.

### 4. Route Table Association  
Asocia la subred creada con la tabla de rutas.

---

## 🔧 Variables requeridas

| Variable            | Tipo     | Descripción |
|--------------------|----------|-------------|
| `vpc_id`           | string   | ID de la VPC donde se creará la subnet |
| `subneta_cidr`     | string   | CIDR de la subnet |
| `availability_zone`| string   | Zona de disponibilidad |
| `subneta_name`     | string   | Nombre base para los recursos |

Ejemplo:

```hcl
variable "vpc_id" {
  type = string
}

variable "subneta_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "subneta_name" {
  type = string
}
```

---

## 📤 Outputs

| Output      | Descripción |
|-------------|-------------|
| `subnet_id` | ID de la subnet creada |
| `route_table_id` | ID de la route table creada |

Ejemplo:

```hcl
output "subnet_id" {
  value = aws_subnet.subneta.id
}

output "route_table_id" {
  value = aws_route_table.rt1.id
}
```

---

## 🧩 Ejemplo de uso

```hcl
module "subnet_module" {
  source = "./modules/subnet"

  vpc_id            = "vpc-123456"
  subneta_cidr      = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  subneta_name      = "dev-subnet"
}
```

---

## 🧪 Uso con LocalStack

Si estás usando LocalStack, asegúrate de configurar el provider AWS así:

```hcl
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}
```

LocalStack no elimina recursos automáticamente, así que si cambias nombres o estructuras, puede ser necesario:

```
docker compose down
docker compose up -d
```

---

## 📝 Notas importantes

- LocalStack puede dejar recursos “huérfanos”, así que usa `name_prefix` .
  
---