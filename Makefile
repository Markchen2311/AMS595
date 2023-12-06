
CXX = g++
CXXFLAGS = -Wall -std=c++11
OBJ = pi_approx.o approximations.o HW2main.o

all: HW2main

HW2main: $(OBJ)
	$(CXX) $(CXXFLAGS) -o HW2main $(OBJ)

pi_approx.o: pi_approx.cpp pi_approx.h
	$(CXX) $(CXXFLAGS) -c pi_approx.cpp

approximations.o: approximations.cpp approximations.h
	$(CXX) $(CXXFLAGS) -c approximations.cpp

HW2main.o: HW2main.cpp pi_approx.h approximations.h
	$(CXX) $(CXXFLAGS) -c HW2main.cpp

clean:
	rm -f *.o HW2main
