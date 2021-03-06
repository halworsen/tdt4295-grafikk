#!/usr/bin/env python3

import argparse
from typing import FrozenSet
from os import path

description = """
    This program takes in a .obj file, and returns a file with all the verticies and edges in a format 
    renderable by bugge.
"""



def isFile(string):
    if path.isfile(string):
        return string
    raise FileNotFoundError(string)


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('obj_files', type=isFile, nargs='+', help='the name path to the obj file')
parser.add_argument("-p", "--points", type=int, default=8 ,help="Number of points sent per model frame")
parser.add_argument("-l", "--lines", type=int, default=12 ,help="Number of lines sent per model frame")
args = parser.parse_args()
POINT_NUM = args.points
LINE_NUM = args.lines
FILES = args.obj_files

verticies = []
edges_with_duplicates = []


    
for FILE in FILES:

    with open(FILE, "r") as obj_file:
        for line in obj_file:
            split = line.split()
            if not split: continue
            if split[0] == "v":
                verticies.append((split[1], split[2], split[3]))
                continue
            if split[0] == "f":
                edges_with_duplicates.append(tuple(set([int(split[1].split("/")[0]) - 1, int(split[2].split("/")[0]) - 1])))
                edges_with_duplicates.append(tuple(set([int(split[2].split("/")[0]) - 1, int(split[3].split("/")[0]) - 1])))
                edges_with_duplicates.append(tuple(set([int(split[3].split("/")[0]) - 1, int(split[1].split("/")[0]) - 1])))
                
    edges = list(dict.fromkeys(edges_with_duplicates).keys())



    frameList = []
    frameVetecies = set()
    frameEdges = []

    for edge in edges:
        if len(edge) == 1: continue
        if (len(frameEdges) == LINE_NUM or
        (edge[0] in frameVetecies) + (edge[1] in frameVetecies) + len(frameVetecies) > POINT_NUM ):
            frameList.append((frameVetecies, frameEdges))
            frameVetecies = set()
            frameEdges = []
        frameVetecies.add(edge[0])
        frameVetecies.add(edge[1])
        frameEdges.append(edge)

    if frameEdges:
        frameList.append((frameVetecies, frameEdges))
    print(f"Generated model frames: {len(frameList)}")
    print(f"")





    unused = 0
    with open(f"{FILE}.c", "w") as bugge_file:
        bugge_file.write('#include "linalg.h"\n')
        bugge_file.write('#include "serialize.h"\n')
        bugge_file.write(f'void init_{path.basename(FILE).split(".")[0]}(struct fpga_package *figures) {{\n')
        
        
        for frameIndex, (frameVerticies, frameEdges) in enumerate(frameList):
            bugge_file.write(f"  vec4_t *figure{frameIndex} = figures[{frameIndex}].verts;\n")
            mapping = {}
            for index, vertex in enumerate(frameVerticies):
                mapping[vertex] = index
                bugge_file.write(f"  vec4(&figure{frameIndex}[{index}], {verticies[vertex][0]}, {-float(verticies[vertex][1])}, {verticies[vertex][2]}, 1.0);\n")
            bugge_file.writelines(f"  vec4(&figure{frameIndex}[{index}], 0, 0, 0, 1.0);\n" for index in range(len(frameVerticies), POINT_NUM))
            unused += (POINT_NUM-len(frameVerticies))
            
            
            bugge_file.writelines(f"  figures[{frameIndex}].lines[{index}].start = {mapping[edge[0]]};\n  figures[{frameIndex}].lines[{index}].end = {mapping[edge[1]]};\n" for index, edge in enumerate(frameEdges))
            bugge_file.writelines(f"  figures[{frameIndex}].lines[{index}].start = 0;\n  figures[{frameIndex}].lines[{index}].end = 0;\n" for index in range(len(frameEdges), LINE_NUM))
        
            # bugge_file.writelines(f"  figures[{frameIndex}].lines[{index}].start = {edge[0]+1};\n  figures[{frameIndex}].lines[{index}].end = {edge[1]+1};\n" for index, edge in enumerate(frameEdges))
            # bugge_file.writelines(f"  figures[{frameIndex}].lines[{index}].start = 0;\n  figures[{frameIndex}].lines[{index}].end = 0;\n" for index in range(len(frameEdges), LINE_NUM))
            
            unused += (LINE_NUM-len(frameEdges))
        
        bugge_file.write("}\n")
            
    print(f"{unused} lines in the dataframes are unused")
            
            