# Void Linux — Otimizações do Sistema

## 1. fstab Optimization

###NAO FIZ por cause de recuperação após energia-- Desativar fsck
O `fsck` verifica erros no filesystem periodicamente. Numa máquina pessoal é desnecessário e pode adicionar minutos ao arranque após um reboot inesperado.

Os dois últimos números em cada linha do fstab controlam este comportamento:
- `0` na coluna final = fsck desativado
- `1` ou `2` na coluna final = fsck ativado
- # é o numero que tinha
```
sudo nano /etc/fstab
```

### Usar `noatime` em vez de `defaults`
Por omissão, cada acesso a um ficheiro atualiza o `atime` (access timestamp), o que gera escritas desnecessárias no disco. Substituir `defaults` por `noatime` elimina esse overhead.

Exemplo de `/etc/fstab` otimizado:

```
UUID=f634ad84-2283-4c62-b1ab-d57718e64cbb  swap  swap  sw             0  #
UUID=5c24bcde-e284-457d-b1e1-5845e0e77fb8  /     xfs   noatime        0  #
UUID=C61D-2685                             /boot vfat  umask=0077     0  #
tmpfs                                      /tmp  tmpfs noatime,nosuid 0  #
```

---

## 2. Disable Watchdog

O watchdog do kernel monitoriza o estado do sistema e reinicia a máquina se detetar um hang. Numa máquina pessoal onde se pode reiniciar manualmente, é overhead desnecessário.


$ sudo mousepad /etc/default/grub


Adicionar ao `GRUB_CMDLINE_LINUX_DEFAULT` em `/etc/default/grub`:

```
nowatchdog
```

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 nowatchdog"
```


Depois atualizar o GRUB:

```sh
sudo update-grub
```

---

## 3. Ananicy

O Ananicy (ANother Auto NICe daemon) ajusta automaticamente as prioridades de CPU e I/O dos processos com base num conjunto de regras mantido pela comunidade. Aplicações interativas recebem prioridade mais alta; tarefas em background são limitadas.

### Instalação

```sh
git clone https://github.com/Nefelim4ag/Ananicy.git
cd Ananicy
sudo make install
sudo mkdir /etc/sv/ananicy
```

### Serviço runit

Criar o script `run`:

```sh
sudo nano /etc/sv/ananicy/run
```

```sh
#!/bin/sh
exec /usr/bin/ananicy start
```

Criar o script `finish`:

```sh
sudo nano /etc/sv/ananicy/finish
```

```sh
#!/bin/sh
exec /sbin/sysctl -e kernel.sched_autogroup_enabled=1
```

Tornar executáveis e ativar o serviço:

```sh
sudo chmod +x /etc/sv/ananicy/run /etc/sv/ananicy/finish
sudo ln -sfv /etc/sv/ananicy /var/service
```

---

## 4. Initramfs Optimization

Recompilar o initramfs com compressão `zstd` para reduzir o tamanho e melhorar o tempo de descompressão no arranque:


$ sudo gedit /etc/dracut.conf.d/boot.conf

hostonly=yes
hostonly_cmdline=no
use_fstab=yes
compress="zstd"
omit_dracutmodules+=" dash i18n rpmversion convertfs btrfs lvm qemu \
  multipath qemu-net lunmask fstab-sys terminfo securityfs img-lib \
  biosdevname caps crypt crypt-gpg dmraid dmsquash-live mdraid nbd \
  nfs network "
nofscks=yes
no_hostonly_commandline=yes




```sh
sudo dracut --force --compress zstd
```

