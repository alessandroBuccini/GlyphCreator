GlyphCreator
=============

Package attached to the paper:

_Alessandro Buccini and Elisa Crabu_
**A tool for the construction of synthetic petroglyphs**
25th International Conference on Computational Science 
and Its Applications (ICCSA), Pages 417-429, 2026
[link](https://doi.org/10.1007/978-3-031-97638-4_26)

---

AUTHORS
-------

- Alessandro Buccini,
       University of Cagliari, Italy
- Elisa Crabu,
       University of Cagliari, Italy

> Email: alessandro.buccini@unica.it, elisa.crabu@unica.it

---

DESCRIPTION
-----------

This package provides a Matlab tool with a graphic user interface to create 
three-dimensional realistic surfaces where petroglyphs have been carved. 
The user can select the shape, position, and depths of these petroglyphs. 

Release: 1.0, February 2025

Programming language: Matlab 9.11 (R2021b)

License: (see license.md)

---

INSTALLATION
------------

Download and extract the GlyphCreator package. To run the GlyphCreator.mlapp file the 
the files  createGlyph.m, createSpiral.m, createZigZag.m, and background.mat must be
in the current folder or in the path.

---

PACKAGE USE
------------

As long as all necessary files are in the working directory (see above), the
GlyphCreator.mlapp may be executed without any other additional files. 


---

PACKAGE STRUCTURE
-----------------

The following is a list with a brief description of the contents of the
GlyphCreator package. For a more detailed description see the paper linked.

* GlyphCreator.mlapp	: Matlab application.
* License.md			: Markdown file containing license for package use. 
* README.md				: This file.
* createGlyph.m			: Auxiliary Matlab function required to run the GUI.
* createSpiral.m		: Auxiliary Matlab function required to run the GUI.
* createZigZag.m		: Auxiliary Matlab function required to run the GUI.
* background.mat		: data file that contains the two backgrounds on 
which we carve the petroglyphs
---
