

import os
from PIL import Image


def ensure_dir(directory):
    if not os.path.exists(directory):
        os.mkdir(directory)


def replace_values(value, dictionary: dict):
    for key in dictionary.keys():
        value = value.replace(key, dictionary[key])
    return value


def replace_file(filepath, dictionary: dict, destination = None):
    if not destination:
        destination = replace_values(filepath, dictionary)
    
    lines = []
    with open(filepath, "r") as file:
        lines = [replace_values(line, dictionary) for line in file.readlines()]
    with open(destination, "w") as file:
        file.writelines(lines)


def replace_propagate(directory, dictionary, destination = None):
    if not destination:
        destination = replace_values(directory, dictionary)
    if not os.path.exists(destination):
        os.mkdir(destination)

    # Replace files
    for filename in [name for name in os.listdir(directory) if os.path.isfile(directory + "/" + name)]:
        replace_file(filename, dictionary)
    
    # Propagate through directories
    for dirname in [name for name in os.listdir(directory) if os.path.isdir(directory + "/" + name)]:
        new_dirname = replace_values(dirname, dictionary)
        new_destination = destination + "/" + new_dirname
        os.mkdir(new_destination)

        replace_propagate(directory + "/" + dirname, dictionary, new_destination)


def replace_palette(img: Image.Image, old_palette: list, new_palette: list):
    for x in range(img.size[0]):
        for y in range(img.size[1]):
            pixel = img.getpixel((x, y))
            if pixel in old_palette:
                index = old_palette.index(pixel)
                img.putpixel((x, y), new_palette[index])
    return img

def fit_image(img: Image.Image):
    size = [int(img.width), int(img.height)]

    end_size = [int(img.width), int(img.height)]

    not_snug = False
    for x in range(size[0]):
        if not_snug:
            break
        for y in range(size[1]):
            pixel = img.getpixel((x, y))
            if pixel[3] == 0:
                not_snug = True
                break
    
    if not_snug:
        for x in range(size[0]):
            pixel = img.getpixel((x, 0))
            if pixel[3] != 0:
                end_size[0] = size[0] - 2*x
                break
        for y in range(size[1]):
            pixel = img.getpixel((0, y))
            if pixel[3] != 0:
                end_size[1] = size[1] - 2*y
                break

        return img.crop(((size[0] - end_size[0])/2, (size[1] - end_size[1])/2, (size[0] - end_size[0])/2 + end_size[0], (size[1] - end_size[1])/2 + end_size[1]))
    return img


os.chdir("data/fancyui/function/ui/safety/fixed/saving/slot")

replacements = {}
for i in range(54):
    replacements["_INT_"] = str(i)

    replace_file("_INT_.mcfunction", replacements)




    



