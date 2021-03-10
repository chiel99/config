#! /usr/local/bin/python3

from PIL import Image, ImageDraw
import PIL.ImageOps
import sys

def shutter_image(filepath, width):
    input_img = Image.open(filepath)
    img_width, img_height = input_img.size

    # creating the depth image
    depth_img = Image.new('RGBA', (img_width, img_height), (0,0,0,255))

    # Generate gray depth from 200 to 20
    depth_step = 180 / width
    # Add strip on rgb image by alpha value == 0
    alpha_mask = Image.new('1', input_img.size)
    for y in range(img_height):
        for x in range(img_width):
            if int(x / width) % 2 == 1:
                alpha_mask.putpixel((x,y), 0)
                value = 200 - (x%5)*depth_step
                value = int(value)
                depth_img.putpixel((x,y), (value,value,value,255))
            else:
                alpha_mask.putpixel((x,y), 255)
                depth_img.putpixel((x,y), (240,240,240,255))
    input_img.putalpha(alpha_mask)

    input_img.show()
    depth_img.show()
    saved_file = filepath.split('.')[0] + "_new.png"
    depth_file = filepath.split('.')[0] + "_depth.png"
    input_img.save(saved_file)
    depth_img.save(depth_file)

def usage():
    print("shutter_image.py <image.png> <width in pixel>")

if __name__ == '__main__':
    if len(sys.argv) < 3:
        usage()
        exit(0)

    filepath = sys.argv[1]
    width = int(sys.argv[2])
    shutter_image(filepath, width)
