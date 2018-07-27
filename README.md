
**Minideb** :octocat:

Este Script automatiza a pós-instalação do Debian, implementando um sistema limpo e minimalista com o openbox;

<img src="https://raw.githubusercontent.com/fm4lloc/stuff/master/2018-07-26-220456_1920x1080_scrot.jpg"/>
          
<img src="https://raw.githubusercontent.com/fm4lloc/stuff/master/2018-07-26-220625_1920x1080_scrot.jpg"/>

Atualmente testado no Debian 9.5, mas a cada nova atualização o script passara pelad mudanças necessárias.

Para usar o script você deve instalar uma versão limpa do Debian, preferencialmente usando uma .iso netinstall, além disso, dispensar a instalação de sofwatres pré-definidos, como o caso de qualquer ambiente de Área de Trabalho. A única coisa que vamos precisar serão os "utilitários de sistema padrão", mas não é obrigatório se quiser um sistema ainda mais enxuto.

<img src="https://raw.githubusercontent.com/fm4lloc/stuff/master/2018-07-26-120025_1920x1080_scrot.jpg"/>

> **Modo de usar**

Antes de iniciar os trabalhos adicione o seu usuário ao grupo *sudo* seguindo as linhas abaixo, lembrando de substituir a palavra *YOUR_USER* pelo nome do utilizador do sistema.

```
# su
# apt-get install sudo
# aduser YOUR_USER sudo
# halt --r now
```
> **Depois de adicionar o seu usuário ao grupo e reinicie o sistema execute os seguintes comados:**
```
$ cd ~
$ sudo apt-get install git
$ git clone https://github.com/fm4lloc/minideb
$ cd minideb
$ chmod +x ./install.sh
$ ./install -i
```
