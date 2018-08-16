#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/visualization/cloud_viewer.h>
#include <vector>
#include <string>
#include <fstream>

#include <pcl/filters/passthrough.h>
#include <pcl/filters/extract_indices.h>

#define GRID_LENGTH 0.5
#define GRID_NUMBER 60
#define Foward 1
#define Backward 0


void print_grid2(int grid[GRID_NUMBER][GRID_NUMBER]);

void print_grid1(int grid[GRID_NUMBER][GRID_NUMBER]);

void print_grid2_de(int grid[GRID_NUMBER][GRID_NUMBER]);

void print_grid1_de(int grid[GRID_NUMBER][GRID_NUMBER]);

/* Find the intensity of points in the grid and store the values in grid1 and grid2, for the live LiDAR data
*/

void find_intensity_default(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER]);


/* Find the intensity of points in the grid and store the values in grid1 and grid2
*/

void find_intensity(const pcl::PointCloud<pcl::PointXYZ>::ConstPtr cloud, int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER]);

/* Read the intensity values and write the result to txt file
*/
void mesh_select(int grid1[GRID_NUMBER][GRID_NUMBER], int grid2[GRID_NUMBER][GRID_NUMBER], int driving_dir);
