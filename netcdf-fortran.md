## Working with netCDF Files in Fortran

https://www.unidata.ucar.edu/software/netcdf/docs-fortran/index.html

Installation steps: https://www.unidata.ucar.edu/software/netcdf/docs/building_netcdf_fortran.html

## Importing the ```netcdf``` library

```fortran
use netcdf
```
---

## netCDF Functions

vv

---

## Executing Scripts with netCDF

Since the ```netcdf``` package is installed in a specific location, the ```gfortran``` comiler must be run with specific flags that force the program to execute with necessary libraries. 

MY specific setup needs ```-I``` and ```-L``` flags.

* ```-I``` will include the neccessary netcdf-fortran package (I believe...)

* ```-L``` will grab...

```shell
$ gfortran example.f90 -o example.out -I/usr/local/Cellar/netcdf/4.7.3_2/include -L/usr/local/Cellar/netcdf/4.7.3_2/lib -lnetcdff -lnetcdf
```
Again, this is specific to my installation with ```gcc``` and the default locations of my ```netcdf``` libraries. There are many pitfalls in trying to get the Fortran script to compile when using ```netcdf``` so please look up how to do it on your machine.

---



