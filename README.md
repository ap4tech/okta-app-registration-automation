# Okta SAML PowerShell Automation Project

## 🛠️ What I Did
1. Registered a sample SAML app in Okta.  
2. Wrote a PowerShell script (`provision-saml-app.ps1`) to provision users to the app through Okta’s API.  
3. Verified that users provisioned in Okta (via SailPoint) were correctly pushed into the SAML app.  

**Problem Solved:**  
Some apps don’t have pre-built connectors in Okta. This script acts as the bridge, allowing automatic user provisioning via Okta’s API.  

---

## 🚀 Use Case
- **Tech Stack:**  
  - **SailPoint** → handles identity governance, lifecycle, roles, and access policies.  
  - **Okta** → serves as the Identity Provider (IdP) for authentication and SSO.  
  - **Application (SAML-enabled)** → consumes user + role/group provisioning.  

---

## 📷 Screenshots
- Okta SAML App Configuration:  
  ![Okta SAML Config](./screenshots/okta-saml-config.png)

- PowerShell Script Example:  
  ![PowerShell Script](./screenshots/powershell-script.png)

---

## 📂 Files
- **scripts/provision-saml-app.ps1** → Main PowerShell provisioning script.  
- **screenshots/** → Setup and demo screenshots.  
