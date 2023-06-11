import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np

type_A = 0
type_B = 0
image = r"C:\Users\adipk\OneDrive\Documents\images.jpg"

# RGB(3 streams) matrix representation of the image
labrat = mpimg.imread(image)
print("Shape of the image: {}".format(labrat.shape))

threshold_limit = [100, 100, 100]
for i in range(0, 168):
    for j in range(0, 300):
        a = labrat[i, j]
        if a[0] >= threshold_limit[0] and a[1] >= threshold_limit[1] and a[2] >= threshold_limit[2]:
            type_A += 1
        else:
            type_B += 1

total_pixels = 168 * 300
percentage_type_A = (type_A * 100) / total_pixels
percentage_type_B = (type_B * 100) / total_pixels
print("%typeA", percentage_type_A)
print("%typeB", percentage_type_B)

imgplot = plt.imshow(labrat)
plt.show()

bright = [170, 160, 150]
B_level = (0.21 * bright[0] + 0.72 * bright[1] + 0.07 * bright[2])
B_level = B_level / 3

bw_image = labrat.copy()
for i in range(0, 168):
    for j in range(0, 300):
        a = bw_image[i, j]
        A_level = (0.21 * a[0] + 0.72 * a[1] + 0.07 * a[2])
        A_level = A_level / 3
        if A_level >= B_level:
            bw_image[i, j] = [0, 0, 0]
        else:
            bw_image[i, j] = [255, 255, 255]

imgplot = plt.imshow(bw_image)
plt.show()
