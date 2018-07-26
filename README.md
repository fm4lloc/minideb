
**Minideb**

Este Script automatiza a pós-instalação do Debian, instalando e configurando um sistema limpo e minimalista;

Atualmente testado no Debian 9.5, mas a cada nova atuaização o script é atualizado com as mudanças necessárias.

Para usar o script você deve instalar uma versão limpa do Debian, usando
uma .iso netinstall de preferência, dispensando a instalação de sofwatres pré-definidos como o  "debian desktop enviroment".
A única coisa que vamos precisar é dos "últiliários standart de sistema"

> **Modo de usar**

```
# sudo apt-get install sudo
# aduser YOUR_USER $user sudo
# halt -r now
```
> **Depois de adiciona o seu usuário ao grupo sudo e reiniciar o sistema execute os seguintes comados.**

```
$ cd ~
$ git clone https://github.com/fm4lloc/minideb
$ cd minideb
$ chmod +x ./install.sh
$ sudo ./install -i
```
