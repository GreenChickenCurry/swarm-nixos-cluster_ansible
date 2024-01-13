# Ansible плейбук для деплоя Docker Swarm кластера на базе операционной системы NixOS
## Требования
Нам нужно иметь 3 ноды, в каждой из которых смонтированна флешка с Minimal ISO Image NixOS (версия 23.05).

На всех нодах нужно выполнить следующие команды:
```sh
  nix-env -iA nixos.sshpass
  nix-env -iA nixos.python311
```
--- это требования Ansible

На мастер ноде:
```sh
  ifconfig ens18 192.168.100.70 netmask 255.255.255.0
```
На первой рабской ноде:
```sh
  ifconfig ens18 192.168.100.80 netmask 255.255.255.0
```
На второй рабской ноде:
```sh
  ifconfig ens18 192.168.100.81 netmask 255.255.255.0
```
У вас вместо ens18 может быть что-то другое в зависимости от вашей сетевой карты, проверяйте через команду:
```sh
  ip a
```
Важно: Настройка ifconfig зависит от файла inventory.yaml. Возможно вы бы хотели иметь свои ip, тогда вам придётся немного изменить настройки ifconfig, inventory.yaml под себя.


## Деплой
Клонируем репозиторий следующим образом:
```sh
  git clone https://github.com/GreenChickenCurry/swarm-nixos-cluster_ansible.git ansible
```
Далее,
```sh
  cd ansible
```
Запускаем Ansible
```sh
  sudo ansible-playbook -i inventory.yaml ./tasks/main.yaml
```
## Замечание
Монтировать диски и производить установку операционной системы не нужно. Ansible все сделает за нас.

## Что просходит внутри кластера?

В кластере поднимается некоторое веб-приложение, посмотреть на него можно будет перейдя на
```sh
  webapp.stepstyle.home
```
Вне кластера в контейнере поднимается DNS-сервер bind9 благодаря которому у нас имеется соответствующая A запись. Nginx сервер через эту A запись перенаправит нас на это веб-приложение.
