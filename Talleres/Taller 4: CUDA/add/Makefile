NVCC = nvcc

all: add_mtx

%.o : %.cu
	$(NVCC) -c $< -o $@

add_mtx : add_mtx.o
	$(NVCC) $^ -o $@

clean:
rm -rf *.o *.a add_mtx