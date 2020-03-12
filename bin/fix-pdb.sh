#!/bin/bash

# https://github.com/pandegroup/pdbfixer

# PDBFixer provides a simple command line interface that is especially useful if you want to script it to process many files at once. This interface is significantly less flexible than either the desktop interface or the Python API, but it is still powerful enough for many purposes.
# To get usage instructions for the command line interface, type

# pdbfixer --help

# This displays the following information:

# Usage: pdbfixer
#        pdbfixer [options] filename

# When run with no arguments, it launches the user interface.  If any arguments are specified, it runs in command line mode.

# Options:
#   -h, --help            show this help message and exit
#   --pdbid=PDBID         PDB id to retrieve from RCSB [default: None]
#   --url=URL             URL to retrieve PDB from [default: None]
#   --output=FILENAME     output pdb file [default: output.pdb]
#   --add-atoms=ATOMS     which missing atoms to add: all, heavy, hydrogen, or
#                         none [default: all]
#   --keep-heterogens=OPTION
#                         which heterogens to keep: all, water, or none
#                         [default: all]
#   --replace-nonstandard
#                         replace nonstandard residues with standard equivalents
#   --add-residues        add missing residues
#   --water-box=X Y Z     add a water box. The value is the box dimensions in nm
#                         [example: --water-box=2.5 2.4 3.0]
#   --ph=PH               the pH to use for adding missing hydrogens [default:
#                         7.0]
#   --positive-ion=ION    positive ion to include in the water box: Cs+, K+,
#                         Li+, Na+, or Rb+ [default: Na+]
#   --negative-ion=ION    negative ion to include in the water box: Cl-, Br-,
#                         F-, or I- [default: Cl-]
#   --ionic-strength=STRENGTH
#                         molar concentration of ions to add to the water box
#                         [default: 0.0]
# For example, consider the following command line:
# pdbfixer --keep-heterogens=water --replace-nonstandard --water-box=4.0 4.0 3.0 myfile.pdb

# This will load the file "myfile.pdb". It will add any missing atoms to existing residues, but not add any missing residues (because we did not specify --add-residues). Hydrogens will be added that are appropriate at pH 7.0 (the default). If the file contains any nonstandard amino acids or nucleotides, they will be replaced with the closest equivalent standard ones. Any water molecules present in the file will be kept, but all other heterogens will be deleted. Finally a water box of size 4 by 4 by 3 nanometers will be added surrounding the structure. If necessary, counterions will be added to neutralize it (Na+ or Cl-), but no other ions will be added (because we accepted the default ionic strength of 0.0). After making all these changes, the result will be written to a file called "output.pdb".

pdbfixer A6P6V9_3VTE-FAD_CBGA.pdb --output=A6P6V9_3VTE-FAD_CBGA-fixed.pdb --keep-heterogens=water --replace-nonstandard