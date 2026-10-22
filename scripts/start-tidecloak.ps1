# Start a local TideCloak dev server on :8080 (admin/password). Data persists in the "tidecloak-data" volume.
$Image = if ($env:TIDECLOAK_IMAGE) { $env:TIDECLOAK_IMAGE } else { "tideorg/tidecloak-dev:latest" }
$exists = docker ps -a --format "{{.Names}}" | Where-Object { $_ -eq "mytidecloak" }
if ($exists) {
    docker start mytidecloak
} else {
    docker run -d --name mytidecloak -p 8080:8080 `
        -v tidecloak-data:/opt/keycloak/data/h2 `
        -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=password `
        $Image
}
Write-Output "TideCloak starting on http://localhost:8080 (logs: docker logs -f mytidecloak)"
