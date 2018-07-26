
**Minideb**

Este Script automatiza a pós-instalação do Debian, instalando e configurando um sistema limpo e minimalista;

Atualmente testado no Debian 9.5, mas a cada nova atuaização o script será atualizado com as mudanças necessárias.

Para usar o script você deve instalar uma versão limpa do Debian, usando
uma .iso netinstall de preferência, dispensando a instalação de sofwatres pré-definidos como o  "debian desktop enviroment".
A única coisa que vamos precisar é dos "utilitários standart de sistema"

> **Modo de usar**

Antes de iniciar os trabalhos adicione o seu usuário ao grupo *sudo* seguindo as linhas abaixo, lebrando de substituir a YOUR_USER pelo nome do ultilizador.

```
# su
# apt-get install sudo
# aduser YOUR_USER $user sudo
# halt -r now
```
> **Depois de adicionar o seu usuário ao grupo reinicie o sistema execute os seguintes comados:**

```
$ cd ~
$ sudo apt-get install git
$ git clone https://github.com/fm4lloc/minideb
$ cd minideb
$ chmod +x ./install.sh
$ sudo ./install -i
```
