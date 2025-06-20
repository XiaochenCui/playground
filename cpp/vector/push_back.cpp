// C++ program to demonstrate the
// push_back() method

#include <iostream>
#include <vector>

using namespace std;

// Class
class GFG
{

public:
    int x;

    // Parameterized Constructor
    GFG(int x)
        : x(x)
    {
        cout << "Constructor=>"
             << "x:" << x << endl;
    }

    // Copy Constructor
    GFG(const GFG &GFG)
        : x(GFG.x)
    {
        cout << "Copied=>"
             << "x:" << x << endl;
    }

    // GFG(GFG &&GFG) noexcept
    //     : x(GFG.x)
    // {
    //     cout << "Moved=>x:" << x << endl;
    // }

    ~GFG()
    {
        cout << "destructor=>"
             << "x:" << x << endl;
    }
};

// Driver Code
int main()
{
    // Vector of object of GFG class
    // is created
    vector<GFG> vertices;
    vertices.reserve(10);
    cout << "length of vertices:" << vertices.size()
         << endl;

    // Inserting elements in the object
    // created using push_back() method
    cout << endl;
    // Custom input entries
    vertices.push_back(GFG(1));
    cout << endl;

    vertices.push_back(GFG(11));
    cout << endl;

    // vertices.push_back(GFG(21));
    vertices.emplace_back(21);
    cout << endl;

    return 0;
}