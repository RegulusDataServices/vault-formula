include:
  - .install
  - .service

rename_old_vault_binary_for_backup:
  file.rename:
    - name: /usr/local/bin/vault.bak
    - source: /usr/local/bin/vault
    - require_in:
        - archive: install_vault_binary

extend:
  start_consul_service:
    service:
      - reload: False
      - watch:
          - archive: install_vault_binary
