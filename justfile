default:
    @just --list

build FOLDER:
    podman build ./bootc/evilwoods-{{FOLDER}} -t evilwoods-{{FOLDER}}:latest

build-image WHAT TYPE:
    cd bootc/evilwoods-{{WHAT}} && \
    mkdir -p output && \
    sudo podman run \
        --rm \
        --name evilwoods-server-bootc-image-builder \
        --tty \
        --privileged \
        --security-opt label=type:unconfined_t \
        -v ./config.json:/config.json:ro \
        -v ./output:/output/ \
        -v /var/lib/containers/storage:/var/lib/containers/storage \
        --label bootc.image.builder=true \
        quay.io/centos-bootc/bootc-image-builder:latest \
        localhost/evilwoods-server:latest \
        --output /output/ \
        --type {{TYPE}} \
        --target-arch amd64 \
        --chown 1000:1000


playbook ENV *EXTRA_FLAGS:
    cd ansible && \
    ansible-playbook \
        -i inventory-{{ENV}}.yml \
        setup-evilcloud-playbook.yml \
        --vault-password-file ~/.config/evilwoods/ansible/vault_pass \
        {{EXTRA_FLAGS}}
