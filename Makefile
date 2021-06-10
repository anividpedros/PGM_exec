Matrix.o: Matrix.cpp Matrix.hpp 
	g++ -c Matrix.cpp -o obj/Matrix.o
 
Vect.o: Vect.cpp Vect.hpp
	g++ -c obj/Vect.cpp

Polygon.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp Polygon.cpp Polygon.hpp
	g++ -c obj/Polygon.cpp

GravityFile.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp GravityFile.cpp Polygon.hpp
	g++ -c obj/GravityFile.cpp

MappingGravity.o: Vect.cpp Vect.hpp Matrix.cpp Matrix.hpp MappingGravity.cpp Polygon.hpp
	mpic++ -c obj/MappingGravity.cpp

CreateGravFile: obj/Vect.o obj/Matrix.o obj/Polygon.o obj/GravityFile.o
	g++ -o bin/CreateGravFile obj/Vect.o obj/Matrix.o obj/Polygon.o obj/GravityFile.o

PolyGrav: obj/Vect.o obj/Matrix.o obj/Polygon.o
	g++ -o bin/PolyGrav PolyGravity.cpp Polygon.o Vect.o Matrix.o 

mexPolyGrav: obj/Vect.o obj/Matrix.o obj/Polygon.o
	mex mexPolyGravity.cpp obj/Polygon.o obj/Vect.o obj/Matrix.o -output bin/mexPolyGrav

MapGravityMPI: obj/Vect.o obj/Matrix.o obj/MappingGravity.o obj/Polygon.o
	mpic++ -o bin/MapGravityMPI obj/MappingGravity.o obj/Vect.o obj/Matrix.o obj/Polygon.o

PolyGravCUDA: obj/Vect.o obj/Matrix.o obj/Polygon.o
	nvcc PolyGravCUDA.cu -o bin/PolyGravCUDA obj/Polygon.o obj/Vect.o obj/Matrix.o

clean:
	rm obj/* bin/*
