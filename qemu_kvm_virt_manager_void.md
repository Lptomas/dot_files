# QEMU/KVM + virt-manager no Void Linux
### Guia passo a passo

---

## O que é cada componente

| Componente | O que faz |
|---|---|
| **KVM** | Módulo do kernel Linux que permite virtualização nativa com aceleração de hardware |
| **QEMU** | Emulador que usa o KVM para correr VMs com performance quase nativa |
| **libvirt** | Camada de gestão que abstrai o QEMU/KVM com uma API uniforme |
| **virt-manager** | Interface gráfica para gerir VMs via libvirt |

---

## Passo 1 — Verificar suporte a virtualização

Confirma que o teu CPU suporta virtualização por hardware:

```sh
grep -Ec '(vmx|svm)' /proc/cpuinfo
```

Resultado `> 0` significa que está suportado (`vmx` = Intel, `svm` = AMD).

Verifica também se os módulos KVM estão disponíveis:

```sh
lsmod | grep kvm
```

Deverás ver `kvm_intel` ou `kvm_amd`.

---

## Passo 2 — Instalar os pacotes

```sh
sudo xbps-install -S qemu libvirt virt-manager dnsmasq bridge-utils
```

| Pacote | Porquê |
|---|---|
| `qemu` | O emulador principal |
| `libvirt` | Daemon de gestão de VMs |
| `virt-manager` | Interface gráfica |
| `dnsmasq` | Necessário para a rede NAT das VMs (rede por omissão do libvirt) |
| `bridge-utils` | Ferramentas para criar bridges de rede |

---

## Passo 3 — Ativar o serviço libvirtd

```sh
sudo ln -s /etc/sv/libvirtd /var/service/
sudo ln -s /etc/sv/virtlockd /var/service/
sudo ln -s /etc/sv/virtlogd /var/service/
```

Verifica que estão a correr:

```sh
sudo sv status libvirtd virtlockd virtlogd
```

---

## Passo 4 — Adicionar o utilizador ao grupo libvirt

Para gerir VMs sem precisar de `sudo` no virt-manager:

```sh
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
```

> **Nota:** Tens de fazer logout/login para o grupo ser aplicado à sessão.

---

## Passo 5 — Verificar a rede por omissão

O libvirt cria automaticamente uma rede NAT chamada `default`. Verifica se está ativa:

```sh
sudo virsh net-list --all
```

Se aparecer como `inactive`, ativa-a:

```sh
sudo virsh net-start default
sudo virsh net-autostart default
```

Isto permite que as VMs tenham acesso à internet via NAT, sem configuração adicional.

---

## Passo 6 — Abrir o virt-manager

```sh
virt-manager
```

Na primeira vez deverás ver a ligação `QEMU/KVM` já configurada. Clica duas vezes para te ligares.

---

## Passo 7 — Criar a primeira VM

1. Clica em **"New Virtual Machine"** (ícone de monitor com +)
2. Escolhe **"Local install media (ISO image or CDROM)"**
3. Seleciona o ficheiro ISO do sistema que queres instalar
4. Define RAM e CPUs — para uso geral:
   - RAM: metade da tua RAM física (ex: 4GB se tiveres 8GB)
   - CPUs: metade dos teus cores : VER com: 
   ```sh
   lscpu | grep -E '^CPU\(s\)|^Core|^Thread|^Socket'
   ```
5. Cria um disco virtual — 20–40GB é suficiente para a maioria dos sistemas
6. Revê as definições e clica **"Finish"**

A VM inicia automaticamente e arranca pelo ISO.

---

## Dicas úteis

**Drivers VirtIO para Windows**
Se instalares Windows numa VM, instala os drivers VirtIO para melhor performance de disco e rede. Descarrega o ISO de drivers em:
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/

**Partilhar pasta com a VM**
Usa `virsh` ou o virt-manager em "Add Hardware" → "Filesystem" para partilhar uma pasta do host.

**Snapshots**
O virt-manager suporta snapshots nativamente: menu **"View"** → **"Snapshots"**. Útil antes de testar software.

**Clipboard partilhado**
Instala `spice-vdagent` dentro da VM para partilhar clipboard entre host e guest.

---

## Resolução de problemas comuns

**Erro "permission denied" ao abrir virt-manager**
→ Confirma que fizeste logout/login após adicionar o utilizador ao grupo `libvirt`.

**VMs sem acesso à internet**
→ Verifica se a rede `default` está ativa: `sudo virsh net-list --all`

**Baixa performance**
→ Confirma que o tipo de VM está definido como `KVM` e não `QEMU` puro. No virt-manager, em "Overview" deverás ver `Hypervisor: KVM`.
