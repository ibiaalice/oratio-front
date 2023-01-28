# 👩‍💻 Oratio 
## Introdução 
 Olá, este repositório possui o projeto front-end do Oratio. Mas o que é o **Oratio**? 
 Oratio é o projeto de organização de avaliações de projetos de conclusões de curso para o Curso de Ciência da Computação da Universidade Federal de Campina Grande. Atualmente este projeto está em fase de **MVP** (versão mínima do produto). Sendo apenas um projeto em desenvolvimento. 
 
## Como inicializar o projeto? 

Para inicializar o projeto, é necessário algumas especificações. É necessário ter em sua máquina o **flutter 3.3** e o navegador **google chrome** para visualizar o projeto em execução. Com isso, podemos seguir os próximos passos:

Inicialmente, clone o repositório.
``` bash
git clone https://github.com/ibiaalice/oratio-front
```

após clonado o projeto, entre na pasta **oratio** e instale as dependências do website.
``` bash
flutter pub get 
```
após instaladas as dependências, é necessário a atualização dos arquivos de build (arquivos auto-gerados de apoio)

``` bash
flutter pub run build_runner build 
```
caso aconteça algum erro de atualização, é necessária atualizar com as tags **--delete-conflicting-outputs**, assim:
``` bash
flutter pub run build_runner build --delete-conflicting-outputs 
```

caso esteja atualizando o código do projeto, pode se utilizar o comando de escuta de mudanças instantâneas.
``` bash
flutter pub run build_runner watch 
```
para o build do projeto, execute 

``` bash
flutter run 
```
Para visualizar o projeto, abra o chrome e acesse http://localhost:60045/#/login ou o endereço entregue no final do comando **run** 

## Visual
Abaixo, veja algumas partes do projeto
### tela de login
![tela de login](https://i.pinimg.com/564x/fd/e9/91/fde991c1c6ae8c0b375715c589890229.jpg)

### tela de registro
![tela de registro](https://i.pinimg.com/564x/f1/e4/26/f1e426057488431db968d1591b1c63d0.jpg)

### página inicial (sem semestre)
![abrir projeto](https://i.pinimg.com/564x/cd/8f/7f/cd8f7f8fc1823e8829d2714719b93166.jpg)

### lista de alunos
![lista de alunos](https://i.pinimg.com/564x/6e/f3/57/6ef357b8067712eb3805772981fa1aba.jpg)

### lista de professores
![lista de professores](https://i.pinimg.com/564x/90/29/70/9029703a423fdada59b33f1906ceae27.jpg)

### perfil de alunos
![perfil de aluno](https://i.pinimg.com/564x/c2/be/5d/c2be5dc5d9b720c4ab8efd356e6c0d0c.jpg)

### lista de projetos
![lista de projetos](https://i.pinimg.com/564x/e8/41/f5/e841f56e98c4ca9163fd33a1a114438b.jpg)
