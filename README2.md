### Лабораторная работа2

### Tutorial
### 1.Настраиваем окружения

```bash
export GITHUB_USERNAME="Vita927"
export GITHUB_EMAIL="vita29.2007@gmail.com"
export GITHUB_TOKEN="мой_токен"
alias edit=nano
```
Результат: переменные заданы,edit открывает nano
### 2.Создаем и настраиваем репозиторий
```
cd ~/Vita927/workspace/projects
mkdir -p lab02 && cd lab02
git init
git config --global user.name "Vita927"
git config --global user.email "vita29.2007@gmail.com"
```
Результат: появилась папка lab02, внутри .git/,Git настроен
### 3.Создадим привязку к удаленному репозиторию 
```
git remote add origin https://github.com/Vita927/lab02.git
```
Результат: репозиторий связан с удаленным
### 4.Создаем README и первый коммит
```
echo "# lab02" > README.md
git add README.md
git commit -m "first commit"
git push -u origin master
```
Результат: на GitHub появился README.md
### 5.Создаем .gitignore
```
cat > .gitignore << EOF
*build*
*install*
*.swp
.idea/
EOF
git add .gitignore
git commit -m "add gitignore"
git push
```
Результат: на GitHub появился .gitignore
### 6.Создаем структуру проекта
```
mkdir -p sources include examples
```
### 7.Создаем файлы библиотеки
```
cat > include/print.hpp << EOF
#include <fstream>
#include <iostream>
#include <string>

void print(const std::string& text, std::ofstream& out);
void print(const std::string& text, std::ostream& out = std::cout);
EOF

cat > sources/print.cpp << EOF
#include <print.hpp>

void print(const std::string& text, std::ostream& out)
{
    out << text;
}

void print(const std::string& text, std::ofstream& out)
{
    out << text;
}
EOF
```
Результат: появились папки sources/,include/,examples/ и файлы внутри
### 8. Создаем примеры
```
cat > examples/example1.cpp << EOF
#include <print.hpp>

int main(int argc, char** argv)
{
    print("hello");
}
EOF

cat > examples/example2.cpp << EOF
#include <print.hpp>
#include <fstream>

int main(int argc, char** argv)
{
    std::ofstream file("log.txt");
    print(std::string("hello"), file);
}
EOF
```
Результат: в examples/ два файла с примерами 
### 9. Отправляем все файлы на GitHub
```
git add .
git commit -m "added sources"
git push origin master
```
Результат: на GitHub появились все папки и файлы
### Homework
### 1. Part 1

```
cat > hello_world.cpp << EOF
#include <iostream>
using namespace std;

int main() {
    cout << "Hello world" << endl;
    return 0;
}
EOF

git add hello_world.cpp
git commit -m "add hello_world with bad style"
git push origin master
```
Результат: на GitHub появился hello_world.cpp версия 1

```
cat > hello_world.cpp << EOF
#include <iostream>
#include <string>

int main() {
    std::string name;
    std::cout << "Enter name: ";
    std::cin >> name;
    std::cout << "Hello world from " << name << std::endl;
    return 0;
}
EOF

git add hello_world.cpp
git commit -m "add hello world with user input"
git push origin master
```
Результат: программа спрашивает имя, выводит Hello world from @name.
### 2. Part 2
```
git checkout -b patch1
git commit -am "remove using namespace std"
git push -u origin patch1
```
Результат: на GitHub появилась ветка patch1

```
git commit -am "add comments"
git push
```
Результат: в PR patch1-master появились новые изменения

```
git checkout master
git pull origin master
git branch -d patch1
```
Результат: ветки patch1 нет
### 3. Part
```shell 
git checkout patch2
```
Результат: ветка patch2 на GitHub 
```
nano hello_world.cpp
```
```
git add hello_world.cpp
git commit -m "add comments to hello_world"
git push origin patch2
```
```
clang-format -style=Mozilla -i hello_world.cpp
git add hello_world.cpp
git commit -m "apply clang-format Mozilla style"
git push origin patch2
```
Результат: Локальный master содержит изменения,веток нет
###Результат: 
мы создали ветки patch1 и patch2, после чего удалили их