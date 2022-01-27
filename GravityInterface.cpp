#include "Polygon.hpp"
#include "Vect.hpp"
#include "Matrix.hpp"

extern "C" {
    Polygon* initGravityFile(char* filepath) {
        std::ifstream gravityFile(filepath);
        return new Polygon(gravityFile);
    }

    void computeGravity(Polygon* polygon, double* in, double* out) { // __declspec(dllexport) 
            Vect Xsc(3);
            Xsc[0] = in[0];
            Xsc[1] = in[1];
            Xsc[2] = in[2];

            Vect gravity(3);
            gravity = PolyGrav(Xsc, *polygon);

            out[0] = gravity[0];
            out[1] = gravity[1];
            out[2] = gravity[2];
    }

    void deletePolygon(Polygon* polygon) {
        delete polygon;
    }
}
