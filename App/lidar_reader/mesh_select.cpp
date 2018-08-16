
#include "mesh_select.h"

void print_grid2(int grid[GRID_NUMBER][GRID_NUMBER]) {
    for (int i=9; i>-1; i--) {
        for (int j=0; j<10; j++) {
            std::cout << grid[i][j] << " ";
        }
        std::cout << endl;
    }
}

void print_grid1(int grid[GRID_NUMBER][GRID_NUMBER]) {
    for (int i=9; i>-1; i--) {
        for (int j=9; j>-1; j--) {
            std::cout << grid[i][j] << " ";
        }
        std::cout << endl;
    }
}

void print_grid2_de(int grid[GRID_NUMBER][GRID_NUMBER]) {
    for (int i=9; i>-1; i--) {
        for (int j=9; j>-1; j--) {
            std::cout << grid[j][i] << " ";
        }
        std::cout << endl;
    }
}

void print_grid1_de(int grid[GRID_NUMBER][GRID_NUMBER]) {
    for (int i=9; i>-1; i--) {
        for (int j=0; j<10; j++) {
            std::cout << grid[j][i] << " ";
        }
        std::cout << endl;
    }
}

void find_intensity(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER]) 
{
    for (size_t i = 0; i < cloud->points.size (); ++i) {
        if (cloud->points[i].z > -100) {
            if (cloud->points[i].x > 0 && cloud->points[i].x < (GRID_NUMBER/2) && cloud->points[i].y > 0 && cloud->points[i].y < (GRID_NUMBER/2)) {
                int ind_x = cloud->points[i].x / GRID_LENGTH;
                int ind_y = cloud->points[i].y / GRID_LENGTH;
                //std::cout << "x: " << ind_x << ", y = " << ind_y << endl;
                grid1[ind_x][ind_y] = grid1[ind_x][ind_y] + 1; 
            } 
            else if (cloud->points[i].x > 0 && cloud->points[i].x < (GRID_NUMBER/2) && cloud->points[i].y < 0 && cloud->points[i].y > (-GRID_NUMBER/2)) {
                int ind_x = cloud->points[i].x / GRID_LENGTH;
                int ind_y = -(cloud->points[i].y) / GRID_LENGTH;
                //std::cout << "x: " << ind_x << ", y = " << ind_y << " negative y" << endl;
                grid2[ind_x][ind_y] = grid2[ind_x][ind_y] + 1; 
            } 
        }
    }
}

void find_intensity_default(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER]) 
{
    for (size_t i = 0; i < cloud->points.size (); ++i) {
        if (cloud->points[i].z > -100) {
            if (cloud->points[i].y > 0 && cloud->points[i].y < (GRID_NUMBER/2) && cloud->points[i].x > 0 && cloud->points[i].x < (GRID_NUMBER/2)) {
                int ind_x = cloud->points[i].x / GRID_LENGTH;
                int ind_y = cloud->points[i].y / GRID_LENGTH;
                //std::cout << "x: " << ind_x << ", y = " << ind_y << endl;
                grid1[ind_x][ind_y] = grid1[ind_x][ind_y] + 1; 
            } 
            else if (cloud->points[i].y > 0 && cloud->points[i].y < (GRID_NUMBER/2) && cloud->points[i].x < 0 && cloud->points[i].x > (-GRID_NUMBER/2)) {
                int ind_x = -(cloud->points[i].x) / GRID_LENGTH;
                int ind_y = cloud->points[i].y / GRID_LENGTH;
                //std::cout << "x: " << ind_x << ", y = " << ind_y << " negative y" << endl;
                grid2[ind_x][ind_y] = grid2[ind_x][ind_y] + 1; 
            } 
        }
    }
}

void mesh_select(int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER], int driving_dir) {
    
    int min_left = GRID_NUMBER;    
    int min_right = GRID_NUMBER;    
    int min_front1 = GRID_NUMBER;
    int min_front2 = GRID_NUMBER;

    // front1
    for (int j = 0; j < GRID_NUMBER; j++) {
        for (int i = 0; i < 2; i++) {
            if (grid1[j][i] > 0) {
                std::cout << "something in front, grid1[" << j << "][" << i << "], " << grid1[j][i]  << endl;
                if (j < min_front1 ) {
                    min_front1 = j;
                    break;
                }
            }
        }
        if (min_front1 < GRID_NUMBER) {
            break;
        }
    }

    // front2
    for (int j = 0; j < GRID_NUMBER; j++) {
        for (int i = 0; i < 2; i++) {
            if (grid2[j][i] > 0) {
                std::cout << "something in front, grid2[" << j << "][" << i << "], " << grid2[j][i]  << endl;
                if (j < min_front2 ) {
                    min_front2 = j;
                    break;
                }
            }
        }
        if (min_front2 < GRID_NUMBER) {
            break;
        }
    }

    // left
    for (int i = 2; i < GRID_NUMBER; i++) {
        for (int j = 0; j < 4; j++) {
            if (grid1[j][i] > 50) {
                std::cout << "something at left, grid1[" << j << "][" << i << "], " << grid1[j][i]  << endl;
                if (i < min_left ) {
                    min_left = i;
                    break;
                }
            }
        }
        if (min_left < GRID_NUMBER) {
            break;
        }
    }

    // right
    for (int i = 2; i < GRID_NUMBER; i++) {
        for (int j = 0; j < 4; j++) {
            if (grid2[j][i] > 50) {
                std::cout << "something at right, grid2[" << j << "][" << i << "], " << grid2[j][i]  << endl;
                if (i < min_right) {
                    min_right = i;
                    break;
                }
            }
        }
        if (min_right < GRID_NUMBER) {
            break;
        }
    }

    std::cout << "min_left = " << min_left << ", min_right = " << min_right << endl;
    
    int min_front = std::min(min_front1, min_front2);
    std::cout << "min_front = " << min_front << endl;

    std::ofstream file;
    //std::string fn = "result/frame" + std::to_string(frame) + ".txt";
    std::string fn = "mesh_decision.txt";    

    file.open(fn.c_str(), std::ofstream::out);

    // obstacles only [left or right] 
    if (min_front <= 4) {
        if (driving_dir == Foward) {
            std::cout << "Mesh Type: Rectange FB Wide Mesh  Viewpoint: N" << endl;
            file << "Mesh:2, Viewpoint:S" << endl;
        }
        else {
            std::cout << "Mesh Type: Rectange FB Wide Mesh  Viewpoint: N" << endl;
            file << "Mesh:2, Viewpoint:N" << endl;
        }
    }
    else if (min_left <= 3 && min_right <= 3) {
        if (driving_dir == Foward) {
            std::cout << "Mesh Type: Rectange Narrow Mesh   Viewpoint: N" << endl;
            file << "Mesh:1, Viewpoint:S" << endl;
        }
        else {
            std::cout << "Mesh Type: Rectange Narrow Mesh   Viewpoint: N" << endl;
            file << "Mesh:1, Viewpoint:N" << endl;
        }
    }
    else if (min_left <= 3) {
        if (driving_dir == Foward) {
            std::cout << "Mesh Type: Rectange LR Wide Mesh  Viewpoint: T" << endl;
            file << "Mesh:3, Viewpoint:T" << endl;
        }
        else {
            std::cout << "Mesh Type: Rectange LR Wide Mesh  Viewpoint: T" << endl;
            file << "Mesh:3, Viewpoint:T" << endl;
        }
    }
    else if (min_right <= 3) {
        if (driving_dir == Foward) {
            std::cout << "Mesh Type: Rectange LR Wide Mesh  Viewpoint: T" << endl;
            file << "Mesh:3, Viewpoint:T" << endl;
        }
        else {
            std::cout << "Mesh Type: Rectange LR Wide Mesh  Viewpoint: T" << endl;
            file << "Mesh:3, Viewpoint:T" << endl;
        }
    }
    // obstacles [front/back]
    else {
        if (driving_dir == Foward) {
            std::cout << "Mesh Type: Rectange Normal Mesh  Viewpoint: S" << endl;
            file << "Mesh:0, Viewpoint:S" << endl;
        }
        else {
            std::cout << "Mesh Type: Rectange Normal Mesh  Viewpoint: N" << endl;
            file << "Mesh:0, Viewpoint:N" << endl;
        }

    }
    file.close(); 

}
