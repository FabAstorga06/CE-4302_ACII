NVCC = nvcc

all: mult_mtx

%.o : %.cu
	$(NVCC) -c $< -o $@

mult_mtx : mult_mtx.o
	$(NVCC) $^ -o $@

clean:
rm -rf *.o *.a mult_mtx