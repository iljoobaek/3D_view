CC=g++ -std=c++11
CFLAGS=-Wall -I. -L/usr/local/lib -L/usr/include/x86-64-linux-gnu/ -L/usr/lib/x86_64-linux-gnu/ 
DEPS = shader.hpp texture.hpp objloader.hpp 
OBJ = surround_view.o shader.o texture.o objloader.o
TARGET = surround_view

LIBS=-lGL -lGLEW -lGLU -lGLEW -lGLESv2 -lglfw3 -lglut -lopencv_shape -lopencv_stitching -lopencv_objdetect -lopencv_superres -lopencv_videostab -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lopencv_videoio -lopencv_photo -lopencv_ml -lopencv_imgproc -lopencv_flann -lopencv_core -lavcodec -lavformat -lswscale -lavutil -lX11 -lXrandr -lXi -lXxf86vm -lpthread -ldl -lXinerama -lXcursor -lrt -lm

.PHONY = clean

%.o: %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(TARGET): $(OBJ)
	g++ -o $@ $^ $(CFLAGS) $(LIBS)
	-rm *.o

clean:
	-rm $(TARGET)
