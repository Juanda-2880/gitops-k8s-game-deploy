#  Overwatch Fan Page | Multi-Cloud DevSecOps Project

[![CI/CD Pipeline](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?style=for-the-badge&logo=github-actions)](https://github.com/Juanda-2880/gitops-k8s-page-deploy/actions)
[![Cloud Azure](https://img.shields.io/badge/Azure-AKS-%230072C6?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Cloud AWS](https://img.shields.io/badge/AWS-EC2-%23FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![GitOps](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?style=for-the-badge&logo=argo)](https://argoproj.github.io/cd/)
[![Security Scan](https://img.shields.io/badge/Trivy-Container%20Security-aquamarine?style=for-the-badge&logo=aquasecurity)](https://github.com/Juanda-2880/gitops-k8s-page-deploy/actions)
[![Quality Gate](https://img.shields.io/badge/SonarQube-Code%20Analysis-4E9BCD?style=for-the-badge&logo=sonarqube)](https://www.sonarqube.org/)
[![Infrastructure](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform)](https://www.terraform.io/)

---

##  Project Overview

This repository hosts a robust **Multi-Cloud DevSecOps implementation** for deploying a static web application (Overwatch Fan Page).

The project demonstrates Cloud Engineering skills by orchestrating resources across **two major cloud providers**:
* **Azure (AKS):** Hosting the production Kubernetes cluster where the application runs.
* **AWS (EC2):** Utilizing scalable compute instances for supporting infrastructure.

It employs a modern **GitOps workflow**, automating the entire software delivery lifecycle from code commit to production deployment, ensuring strict security standards and code quality.

---

##  Tech Stack & Tools

| Category | Technology | Usage |
| :--- | :--- | :--- |
| **Container Orchestration** | ![Azure AKS](https://img.shields.io/badge/Azure%20AKS-kubernetes-%230072C6.svg?style=flat&logo=microsoftazure&logoColor=white) | **Azure Kubernetes Service** for production container management. |
| **Cloud Compute** | ![AWS EC2](https://img.shields.io/badge/AWS%20EC2-Compute-%23FF9900.svg?style=flat&logo=amazon-aws&logoColor=white) | **Amazon Elastic Compute Cloud** for infrastructure support. |
| **IaC** | ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white) | Automating the provisioning of both AKS (Azure) and EC2 (AWS). |
| **GitOps** | ![ArgoCD](https://img.shields.io/badge/argo-%23EF7B4D.svg?style=flat&logo=argo&logoColor=white) | Continuous Deployment syncing manifests with the cluster. |
| **CI / CD** | ![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=flat&logo=githubactions&logoColor=white) | Automating Build, Test, Security Scans, and Push pipelines. |
| **Containerization** | ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white) | Packaging the application (Nginx Alpine). |
| **Security** | ![Trivy](https://img.shields.io/badge/trivy-%2310232F.svg?style=flat&logo=aquasecurity&logoColor=white) ![SonarQube](https://img.shields.io/badge/SonarQube-black?style=flat&logo=sonarqube&logoColor=4E9BCD) | Vulnerability Scanning (Image) & Static Code Analysis (SAST). |
| **Frontend** | ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=flat&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=flat&logo=css3&logoColor=white) | **HTML5 & CSS3** for responsive and styled UI. |

---

##  The Pipeline Architecture

The **CI/CD Pipeline** is defined in `.github/workflows/gitops.yml` and executes the following stages sequentially:

### 1.  SAST & Code Quality (SonarQube)
* **Action:** Analyzes the source code (HTML/CSS/JS) for bugs and vulnerabilities.
* **Goal:** Maintain high code quality standards before building artifacts.

### 2.  Build & Push (Docker)
* **Action:** Builds a lightweight Docker image using `nginx:alpine`.
* **Tagging:** Uses dynamic Semantic Versioning (e.g., `v15`, `v16`).
* **Goal:** Create an immutable artifact stored in Docker Hub.

### 3.  Container Security Scan (Trivy)
* **Action:** Scans the newly built image for CVEs (Common Vulnerabilities and Exposures).
* **Policy:** **Fails immediately** if `CRITICAL` or `HIGH` severity vulnerabilities are found.
* **Goal:** Zero-trust security; prevent vulnerable images from reaching the cloud.

### 4.  GitOps Auto-Commit
* **Action:** A bot automatically updates the `deployment.yaml` manifest in the repository with the new image tag.
* **Goal:** Trigger the synchronization process in ArgoCD.

### 5.  Multi-Cloud Deployment
* **Action:** ArgoCD detects the change and syncs the state to the **Azure AKS** cluster.
* **Infrastructure:** Underlying resources (Networking, Nodes) are managed via Terraform on both **Azure** and **AWS**.

---

##  Project Gallery

### 🔹 The Deployed App

<img width="1919" height="994" alt="Screenshot 2026-01-19 175420" src="https://github.com/user-attachments/assets/e107f8aa-3386-4870-b478-bf259d344ecf" />


### 🔹 Infrastructure (Azure AKS & AWS EC2)

<img width="1651" height="192" alt="Screenshot 2026-01-19 182942" src="https://github.com/user-attachments/assets/d2156dfe-fb06-4e13-9df0-d1ab07f9acce" />

<img width="1912" height="424" alt="Screenshot 2026-01-19 183005" src="https://github.com/user-attachments/assets/a3b330c2-6466-4ff2-9cab-eef73a697245" />

### 🔹 ArgoCD Dashboard

<img width="1919" height="892" alt="Screenshot 2026-01-19 184356" src="https://github.com/user-attachments/assets/e69b14ed-f8da-41b9-a12a-0f1be3740d2e" />


### 🔹 The CI/CD Pipeline

<img width="929" height="427" alt="Screenshot 2026-01-19 145710" src="https://github.com/user-attachments/assets/30d00a0f-1321-4aa1-9d13-157e76ad5bdc" />


---
##  Repository Structure

```text
gitops-k8s-page-deploy/
├── .github/workflows/     # CI/CD Pipeline Definitions
├── ArgoCD/
│   └── Manifests/         # K8s Manifests (Deployment, Service)
├── Aws/                   # Terraform configurations for AWS EC2
├── Page/                  # Application Source Code
│   ├── src/               # HTML & CSS logic
│   └── Dockerfile         # Nginx Container Config
├── Terraform/             # Terraform configurations for Azure AKS
└── README.md              # Project Documentation
```
---

## Author
Juan David Pacheco Vargas Telematics Engineering Student, Cloud & DevOps Enthusiast

LinkedIn: https://www.linkedin.com/in/juan-david-pacheco/

GitHub: @Juanda-2880


