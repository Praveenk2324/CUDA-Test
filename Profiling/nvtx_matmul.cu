#include <cuda_runtime.h>
#include <nvtx3/nvToolsExt.h>
#include <iostream>

#define BLOCK_SIZE 16

__global__ void matrixmulKernel(float* A, float* B, float* C, int N){
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0.0f;

    if (row < N && col < N){
        for (int i = 0; i < N; i++){
            sum += A[row * N + i] * B[i * N + col];

        }
        C[row * N + col] = sum;
    }
}

void matrixMul(float* A, float* B, float* C, int N){
    
}