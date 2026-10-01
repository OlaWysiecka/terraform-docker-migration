# Terraform Docker Environment Migration

Infrastructure as Code project demonstrating the migration of an existing Docker environment to Terraform.

The project starts with a manually created Docker environment and then imports the existing Docker resources into Terraform for further management.

## Project Goal

The goal of this project is to demonstrate how an existing Docker environment can be migrated to Infrastructure as Code using Terraform.

The environment consists of:
* Custom Docker network
* Persistent Docker volume
* PostgreSQL database
* Web application
* Nginx load balancer

The infrastructure is created locally using Docker Desktop. 

##  Architecture
```bash

                         localhost
                            |
                            v
                  +-------------------+
                  |       Nginx       |
                  |   Load Balancer   |
                  +---------+---------+
                            |
                            v
                  +-------------------+
                  |    Web Application|
                  |     Container     |
                  +---------+---------+
                            |
                            v
                  +-------------------+
                  |    PostgreSQL     |
                  |     Container     |
                  +---------+---------+
                            |
                            v
                  +-------------------+
                  |   Docker Volume   |
                  |  Persistent Data  |
                  +-------------------+
```

## Migration Process

The project follows these stages:
1. Create the Docker infrastructure manually.
2. Verify that all components communicate correctly.
3. Create the Terraform project.
4. Define a modular Terraform structure.
5. Import the existing Docker resources into Terraform.
6. Add variables and outputs.
7. Align Terraform configuration with the existing infrastructure.
8. Validate the final Terraform configuration.
9. Document the migration process.

## Project Structure
```bash
terraform-docker-migration/
│
├── environments/
│   └── local/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
│
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── database/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── web/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── nginx/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── app/
├── nginx/
│   └── nginx.conf
│
├── .gitignore
├── README.md
├── provider.tf
└── versions.tf
```
## Terraform Modules

### Network

Responsible for:
- Custom Docker network
- Network configuration
- Network-related outputs

### Database

Responsible for:
- PostgreSQL container
- Persistent Docker volume
- Database configuration
- Database-related outputs

### Web

Responsible for:
- Web application container
- Application configuration
- Connection to PostgreSQL

### Nginx

Responsible for:
- Nginx container
- Reverse proxy / load balancing configuration
- Exposing the application to localhost

## Docker Components


| Component | Technology | Purpose |
|---|---|---|
| Custom Network | Docker Network | Communication between containers |
| PostgreSQL | PostgreSQL Container | Application database |
| Docker Volume | Docker Volume | Persistent database data |
| Web Application | Docker Container | Application layer |
| Nginx | Nginx Container | Reverse proxy / load balancer |


The existing Docker resources will be imported into Terraform using terraform import.

The goal is to demonstrate the migration from manually managed infrastructure:
```
Docker CLI
    |
    v
Existing Docker infrastructure
    |
    | terraform import
    v
Terraform state
    |
    v
Terraform configuration
```

Terraform will then be used to manage the imported infrastructure as code.

## Validation

The Terraform configuration will be validated using:
```
terraform fmt
terraform validate
terraform plan
```

The final configuration should represent the existing Docker environment without requiring the infrastructure to be recreated unnecessarily.

## Technologies

* Terraform
* Docker Desktop
* Docker
* PostgreSQL
* Nginx
* Git
* GitHub
* Visual Studio Code



## Learning Objectives

The project demonstrates:
- Infrastructure as Code
- Terraform provider usage
- Terraform resource management
- Importing existing infrastructure
- Terraform state
- Modular Terraform architecture
- Variables and outputs
- Docker networking
- Persistent Docker storage
- Container communication
- Reverse proxy configuration
- Infrastructure version control