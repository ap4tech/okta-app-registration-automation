# Okta → Custom App Provisioning Script
# Scenario: Provision user + their Okta roles/groups into the custom app

# === Variables ===
$OktaDomain   = "https://yourcompany.okta.com"
$OktaApiToken = "OKTA_API_TOKEN"
$AppApiUrl    = "https://customapp.company.com/api/users"
$AppApiToken  = "CUSTOM_APP_API_TOKEN"
$OktaAppId    = "YOUR_OKTA_APP_ID" # Set your Okta App ID here

# === 1. Get users assigned to the app in Okta ===
$headersOkta = @{
    "Authorization" = "SSWS $OktaApiToken"
    "Accept"        = "application/json"
}

$users = Invoke-RestMethod -Uri "$OktaDomain/api/v1/apps/$OktaAppId/users" -Headers $headersOkta -Method GET

# === 2. For each user, get groups and roles, then send provisioning request to the custom app ===
$headersApp = @{
    "Authorization" = "Bearer $AppApiToken"
    "Content-Type"  = "application/json"
}

foreach ($user in $users) {
    # Get userId from Okta user object
    $userId = $user.id

    # Get groups for the user
    $groupsResp = Invoke-RestMethod -Uri "$OktaDomain/api/v1/users/$userId/groups" -Headers $headersOkta -Method GET
    $groupNames = $groupsResp | ForEach-Object { $_.profile.name }

    # Get roles for the user
    $rolesResp = Invoke-RestMethod -Uri "$OktaDomain/api/v1/users/$userId/roles" -Headers $headersOkta -Method GET
    $roleNames = $rolesResp | ForEach-Object { $_.type }

    $body = @{
        userName = $user.profile.login
        email    = $user.profile.email
        groups   = $groupNames
        roles    = $roleNames
    } | ConvertTo-Json

    Invoke-RestMethod -Uri $AppApiUrl -Headers $headersApp -Method POST -Body $body
}