# ☁️ Azure Infrastructure Deployment Using Terraform

This project provisions a complete infrastructure setup on **Microsoft Azure** using **Terraform**, including:

- Resource Groups  
- Virtual Networks (VNets) & Subnets  
- Virtual Machines  
- Storage Accounts  
- Application Gateway with Web Application Firewall (WAF)  

---

## 📌 Table of Contents

- [📌 Table of Contents](#-table-of-contents)
- [🚀 Overview](#-overview)
- [📁 Project Structure](#-project-structure)
- [🔧 Prerequisites](#-prerequisites)
- [⚙️ How to Use](#️-how-to-use)
- [📂 Modules Explained](#-modules-explained)
- [📝 Variables](#-variables)
- [📤 Outputs](#-outputs)
- [🛑 Clean Up](#-clean-up)
- [🙌 Contributors](#-contributors)
- [📄 License](#-license)

---

## 🚀 Overview

This repository automates the provisioning of cloud resources in **Azure** using Terraform. It adopts a **modular approach** to ensure reusability and clean code organization.

---

## 📁 Project Structure

```bash
.
├── main.tf                   # Root module to call child module
├── provider.tf               # Azure provider and backend config
├── outputs.tf                # Output values from root module
├── variables.tf              # Input variables (optional)
├── Guide.txt                 # Reference guide (e.g., for VM images)
└── Modules/
    ├── application_gateway.tf   # Application Gateway + Listener + Rules
    ├── landing_zone.tf          # VNet, Subnets, NSGs, Resource Group
    ├── outputs.tf               # Output resources like WAF name, etc.
    ├── Storage_account.tf       # Azure Storage Account setup
    ├── variables.tf             # Input variables for the module
    ├── vm.tf                    # VM provisioning with NICs and Disks
    └── waf.tf                   # Web Application Firewall policy
```

---

## 🔧 Prerequisites

- ✅ [Terraform](https://www.terraform.io/downloads) v1.1 or higher  
- ✅ [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)  
- ✅ An active [Azure Subscription](https://azure.microsoft.com/free/)  
- ✅ Authentication via `az login`  

---

## ⚙️ How to Use

### 🔑 Step 1: Azure Login

```bash
az login
```

### 🧱 Step 2: Initialize Terraform

```bash
terraform init
```

### 🔍 Step 3: Preview the Plan

```bash
terraform plan
```

### 🚀 Step 4: Apply Configuration

```bash
terraform apply
```

> 💡 Use `terraform apply -auto-approve` to skip confirmation prompt.

---

## 📂 Modules Explained

| Module              | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `landing_zone.tf`   | Creates Resource Group, Virtual Network, Subnets, and Network Security Groups |
| `vm.tf`             | Provisions Linux/Windows Virtual Machines, NICs, and required settings       |
| `Storage_account.tf`| Creates a general-purpose v2 storage account                                 |
| `application_gateway.tf` | Deploys Application Gateway with listeners, rules, backend pools         |
| `waf.tf`            | Configures WAF policies (Detection/Prevention mode, custom rules, etc.)      |
| `outputs.tf`        | Returns key values like WAF policy name, App Gateway IP, etc.                |

---

## 📝 Variables

All input variables for the project are defined in:

- `variables.tf` (Root Module)
- `Modules/variables.tf` (Child Modules)

Example variables:

```hcl
variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "vm_admin_username" {
  description = "Admin username for VM"
  type        = string
}
```

You can override these values using a `terraform.tfvars` file.

---

## 📤 Outputs

Key outputs after a successful deployment:

- Public IPs of VMs
- Application Gateway IP
- WAF Policy Name
- Storage Account Name
- Subnet IDs, etc.

These are defined in `outputs.tf` files.

---

## 🛑 Clean Up

To destroy all resources:

```bash
terraform destroy
```

---

## 🙌 Contributors

- **👤 Your Name** – *Terraform Architect*  
- **👤 Team Members** – *Contributors (Optional)*

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

> © 2025 Your Company Name. All rights reserved.
