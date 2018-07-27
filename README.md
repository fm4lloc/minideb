
**Minideb** :octocat:

Este Script automatiza a pós-instalação do Debian, implementando um sistema limpo e minimalista com o Openbox;

![screen1](/screenshot/2018-07-27-084940_1440x900_scrot.jpg)
          
![screen2](/screenshot/2018-07-27-084931_1440x900_scrot.jpg)

Atualmente testado no Debian 9.5, mas com atualizações para futuras versões do sistema.

Para usar o script você deve instalar uma versão limpa do Debian, preferencialmente usando uma .iso netinstall, além disso, deve dispensar a instalação de sofwatres pré-definidos, como o caso de qualquer ambiente de Área de Trabalho. A única coisa que você deve instalar, opcionalmente, é os "utilitários de sistema padrão" se quiser um sistema menos cru.

<img src="https://raw.githubusercontent.com/fm4lloc/stuff/master/2018-07-26-120025_1920x1080_scrot.jpg"/>

> **Modo de usar**

Antes de iniciar os trabalhos adicione o seu usuário ao grupo *sudo* seguindo as linhas abaixo, lembrando de substituir a palavra *YOUR_USER* pelo nome do utilizador do sistema.

```
# su
# apt-get install sudo
# aduser YOUR_USER sudo
# halt --r now
```
> **Depois de adicionar seu usuário, reinicie o sistema e execute os seguintes comandos:**
```
$ cd ~
$ sudo apt-get install git
$ git clone https://github.com/fm4lloc/minideb
$ cd minideb
$ chmod +x ./install.sh
$ ./install -i
```

> **As configurações do openbox ainda contam com os seguintes atalhos de teclado:**

Esses atalhos podem ser modificados no arquivo [/openbox/rc.xml](/openbox/rc.xml)

| Keyboard Shortcut	        | Descrição                            |
| ------------------------- |:------------------------------------:|
| Alt+F                     | Abre o gerenciador de arquivos thunar|
| Alt+E                     | Abre o terminal Sakura               |
| Alt+2                     | Abre o lançador de aplicativos gmrun |
| PrintScreen               | Tira foto da tela usando o scrot     |
