#include <print.hpp>
#include <iostream>
#include <fstream>

int main() {
    std::string log_path = std::getenv("LOG_PATH");
    std::string text;
    while (std::cin >> text) {
        std::ofstream out(log_path, std::ios_base::app);
        print(text, out);
        out << std::endl;
    }
    return 0;
}
