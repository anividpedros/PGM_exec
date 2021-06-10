#include "mex.hpp"
#include "mexAdapter.hpp"
#include "Polygon.hpp"
#include "Matrix.hpp"
#include "Vect.hpp"

using namespace matlab::data;
using matlab::mex::ArgumentList;

class MexFunction : public matlab::mex::Function {
    private:
        ArrayFactory factory;
        std::ifstream GravityFile;
        Polygon polygon;

    public:
        MexFunction() : GravityFile("GravityFile.txt"), polygon(GravityFile) {}
    
        void operator()(ArgumentList outputs, ArgumentList inputs) {
            Vect Xsc(3);
            Xsc[0] = inputs[0][0];
            Xsc[1] = inputs[0][1];
            Xsc[2] = inputs[0][2];

            Vect gravity(3);
            gravity = PolyGrav(Xsc, polygon);

            TypedArray<double> grav = factory.createArray<double>({3,1});
            grav[0] = gravity[0];
            grav[1] = gravity[1];
            grav[2] = gravity[2];

            outputs[0] = std::move(grav);
        }
};
