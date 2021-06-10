Matrix.o: Matrix.cpp Matrix.hpp 
	g++ -c Matrix.cpp -o build/Matrix.o
 
Vect.o: Vect.cpp Vect.hpp
	g++ -c build/Vect.cpp

Polygon.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp Polygon.cpp Polygon.hpp
	g++ -c build/Polygon.cpp

GravityFile.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp GravityFile.cpp Polygon.hpp
	g++ -c build/GravityFile.cpp

MappingGravity.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp MappingGravity.cpp Polygon.hpp
	mpic++ -c build/MappingGravity.cpp

CreateGravFile: build/Vect.o build/Matrix.o build/Polygon.o build/GravityFile.o
	g++ -o bin/CreateGravFile build/Vect.o build/Matrix.o build/Polygon.o build/GravityFile.o

PolyGrav: build/Vect.o build/Matrix.o build/Polygon.o
	g++ -o bin/PolyGrav PolyGravity.cpp Polygon.o Vect.o Matrix.o 

mexPolyGrav: build/Vect.o build/Matrix.o build/Polygon.o
	mex mexPolyGravity.cpp build/Polygon.o build/Vect.o build/Matrix.o -output bin/mexPolyGrav

MapGravityMPI: build/Vect.o build/Matrix.o build/MappingGravity.o build/Polygon.o
	mpic++ -o bin/MapGravityMPI build/MappingGravity.o build/Vect.o build/Matrix.o build/Polygon.o

PolyGravCUDA: build/Vect.o build/Matrix.o build/Polygon.o
	nvcc PolyGravCUDA.cu -o bin/PolyGravCUDA build/Polygon.o build/Vect.o build/Matrix.o

clean:
	rm build/* bin/*
