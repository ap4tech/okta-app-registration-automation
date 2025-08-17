# Okta SAML PowerShell Automation Project

## What I Did:
1. Registered a sample SAML app in Okta.  
2. Wrote a PowerShell script to provision users to the app through Okta’s API.  
3. Verified that users provisioned in Okta (via SailPoint) were correctly pushed into the SAML app.  

## Problem Solved: 
Some apps don’t have pre-built connectors in Okta. This script acts as the bridge, allowing automatic user provisioning via Okta’s API.  

---

## Use Case:
- **Tech Stack:**  
  - **SailPoint** → handles identity governance, lifecycle, roles, and access policies.  
  - **Okta** → serves as the Identity Provider (IdP) for authentication and SSO.  
  - **Application (SAML-enabled)** → consumes user + role/group provisioning.  

---

## Screenshots:
- Okta SAML App Configuration:  
[SSO SAML Config in Okta.png](https://github.com/ap4tech/okta-app-registration-automation/blob/main/SSO%20SAML%20Config%20in%20Okta.png)

- PowerShell Script:  
[  ![PowerShell Script](./screenshots/powershell-script.png)](https://github.com/ap4tech/okta-app-registration-automation/blob/main/Powershell%20app%20register%20script.png)

---

## Files:
https://github.com/ap4tech/okta-app-registration-automation/blob/main/%23%20Okta%20%E2%86%92%20Custom%20App%20Provisioning%20Script.ps1
