default:
    @just --list

build FOLDER:
    podman build ./evlwoods-{{FOLDER}}/bootc -t evilwoods-{{FOLDER}}:latest

build-image TYPE:
    mkdir -p output
    sudo podman run \
        --rm \
        --name evilwoods-server-bootc-image-builder \
        --tty \
        --privileged \
        --security-opt label=type:unconfined_t \
        -v ./config.json:/config.json:ro \
        -v /var/home/aitvaras/Downloads/evilwoods-centos-iso:/output/ \
        -v /var/lib/containers/storage:/var/lib/containers/storage \
        --label bootc.image.builder=true \
        quay.io/centos-bootc/bootc-image-builder:latest \
        ghcr.io/sttagent/evilwoods-server:latest \
        --output /output/ \
        --local \
        --type {{TYPE}} \
        --target-arch amd64 \
        --chown 1000:1000


playbook *EXTRA_FLAGS:
    cd evilwoods-server/ansible && \
    ansible-playbook \
        -i inventory.yml \
        setup-evilcloud-playbook.yml \
        --vault-password-file ~/.config/evilwoods/ansible/vault_pass \
        {{EXTRA_FLAGS}}
