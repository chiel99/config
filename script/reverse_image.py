#! /usr/local/bin/python3

from PIL import Image
import PIL.ImageOps
import sys

def reverse_image(filepath):
    input_img = Image.open(filepath)
    img_width, img_height = input_img.size

    inverted_image = PIL.ImageOps.invert(input_img)

    #inverted_image.show()
    saved_file = filepath.split('.')[0] + "_inv.jpg"
    inverted_image.save(saved_file)

if __name__ == '__main__':
    filepath = sys.argv[1]
    reverse_image(filepath)
