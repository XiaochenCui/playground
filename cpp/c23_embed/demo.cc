#include <iostream>

const char message[] = {
    #embed "message.txt"
    , '\0' // null terminator
};

int main() {
  std::string_view message_str(message);
  std::cout << "message_str: " << message_str << std::endl;
}