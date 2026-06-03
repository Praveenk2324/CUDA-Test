i#include <iostream>
#include <cuda_runtime.h>

// This function runs on the GPU (Device)
__global__ void gpu_hello() {
    int thread_id = threadIdx.x;
    printf("Hello World from GPU Thread %d!\n", thread_id);
}

int main() {
    // This runs on the CPU (Host)
    std::cout << "Hello World from the CPU!" << std::endl;

    // Launch the GPU kernel with 1 block of 4 parallel threads
    gpu_hello<<<1, 4>>>();

    // Force the CPU to wait until the GPU completes its parallel tasks
    cudaDeviceSynchronize();

    std::cout << "GPU execution finished successfully." << std::endl;
    return 0;
}