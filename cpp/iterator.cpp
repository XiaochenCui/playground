#include <iostream>
#include <set>
#include <map>

void demonstrateSet() {
    std::set<int> s = {10, 20, 30, 40, 50};
    std::cout << "Set: ";
    for (auto it = s.begin(); it != s.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // Min and Max values using iterators
    auto minIt = s.begin(); // First element (smallest)
    auto maxIt = --s.end(); // Last element (largest)
    std::cout << "Min value in set: " << *minIt << std::endl;
    std::cout << "Max value in set: " << *maxIt << std::endl;

    // Remove first and last values
    s.erase(minIt);   // Removes the minimum value
    s.erase(maxIt);   // Removes the maximum value
    std::cout << "Set after removing min and max: ";
    for (const auto &elem : s) std::cout << elem << " ";
    std::cout << std::endl;
}

void demonstrateMultiset() {
    std::multiset<int> ms = {10, 20, 30, 30, 40, 50};
    std::cout << "Multiset: ";
    for (auto it = ms.begin(); it != ms.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // Min and Max values using iterators
    auto minIt = ms.begin(); // First element (smallest)
    auto maxIt = --ms.end(); // Last element (largest)
    std::cout << "Min value in multiset: " << *minIt << std::endl;
    std::cout << "Max value in multiset: " << *maxIt << std::endl;

    // Remove first and last values
    ms.erase(minIt);   // Removes the minimum value
    ms.erase(maxIt);   // Removes the maximum value
    std::cout << "Multiset after removing min and max: ";
    for (const auto &elem : ms) std::cout << elem << " ";
    std::cout << std::endl;
}

void demonstrateMap() {
    std::map<int, std::string> m = {{1, "one"}, {2, "two"}, {3, "three"}, {4, "four"}};
    std::cout << "Map: ";
    for (auto it = m.begin(); it != m.end(); ++it) {
        std::cout << it->first << ":" << it->second << " ";
    }
    std::cout << std::endl;

    // Min and Max keys using iterators
    auto minIt = m.begin(); // First key-value pair (smallest key)
    auto maxIt = --m.end(); // Last key-value pair (largest key)
    std::cout << "Min key in map: " << minIt->first << " => " << minIt->second << std::endl;
    std::cout << "Max key in map: " << maxIt->first << " => " << maxIt->second << std::endl;

    // Remove first and last key-value pairs
    m.erase(minIt);   // Removes the first key-value pair
    m.erase(maxIt);   // Removes the last key-value pair
    std::cout << "Map after removing min and max keys: ";
    for (const auto &pair : m) std::cout << pair.first << ":" << pair.second << " ";
    std::cout << std::endl;
}

void demonstrateMultimap() {
    std::multimap<int, std::string> mm = {{1, "one"}, {2, "two"}, {3, "three"}, {3, "tres"}, {4, "four"}};
    std::cout << "Multimap: ";
    for (auto it = mm.begin(); it != mm.end(); ++it) {
        std::cout << it->first << ":" << it->second << " ";
    }
    std::cout << std::endl;

    // Min and Max keys using iterators
    auto minIt = mm.begin(); // First key-value pair (smallest key)
    auto maxIt = --mm.end(); // Last key-value pair (largest key)
    std::cout << "Min key in multimap: " << minIt->first << " => " << minIt->second << std::endl;
    std::cout << "Max key in multimap: " << maxIt->first << " => " << maxIt->second << std::endl;

    // Remove first and last key-value pairs
    mm.erase(minIt);   // Removes the first key-value pair
    mm.erase(maxIt);   // Removes the last key-value pair
    std::cout << "Multimap after removing min and max keys: ";
    for (const auto &pair : mm) std::cout << pair.first << ":" << pair.second << " ";
    std::cout << std::endl;
}

void findAndRemove(std::set<int>& s, int value) {
    auto it = s.find(value);
    if (it != s.end()) {
        std::cout << "Found value " << *it << " in set, removing it.\n";
        s.erase(it);
    } else {
        std::cout << "Value " << value << " not found in set.\n";
    }
}

void findAndRemove(std::map<int, std::string>& m, int key) {
    auto it = m.find(key);
    if (it != m.end()) {
        std::cout << "Found key " << it->first << " in map, removing it.\n";
        m.erase(it);
    } else {
        std::cout << "Key " << key << " not found in map.\n";
    }
}

int main() {
    demonstrateSet();
    demonstrateMultiset();
    demonstrateMap();
    demonstrateMultimap();

    // Find and remove specific key/value example
    std::set<int> s = {10, 20, 30, 40, 50};
    findAndRemove(s, 30);

    std::map<int, std::string> m = {{1, "one"}, {2, "two"}, {3, "three"}, {4, "four"}};
    findAndRemove(m, 2);

    return 0;
}
