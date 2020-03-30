# fortran
Working with Fortran Programming Language]

https://gcc.gnu.org/wiki/GFortranGettingStarted

## Installation and Set up
---

This was an interesting program to setup on my own and I'll try my best to document it here. 

I set Fortran up on a Mac running Mojave 10.14.6

### So many compiler errors....

First thing I realized was I was probably a little over my head on the installation but I was able to power through with the help of merciless Google research and forum searching like Stack Overflow, etc.

I had gcc and gfortan installed a while back. However, when trying to compile a simple ```f90``` I immediately ran into a plethora of errors. 

After tracking down what the errors where, I realized that I was using the Macports version of gcc and gfortran which was 5.5.0. So the next step was to get the most updated versions, and instead of using Macports, I went with Homebrew. 

```brew install gcc```

Which gave gfortran version of 9.3.0, but when running ```gfortran --version``` I continued to get back the Macports version of 5.5.0. Ugg, so the response was to alter the PATH variable to override the default Macports.

The Macports PATH an be viewed by opening the ```.bash_profile```
```shell
atom ~/.bash_profile
```

The Macports PATH was: ```"/opt/local/bin:/opt/local/sbin:$PATH"```

Exploring the gcc PATH for the Homebrew gave: ```usr/local/Cellar/``` So all that needed to be done to have the gcc point to the Homebrew's version would be to add a PATH that points to it.

In the ```.bash_profile``` I added:
```PATH=/usr/local/Cellar/gcc/9.3.0/bin:$PATH```

And now all is good and I can successfully compile my first Fortran script!

---

## Compiling Fortran Programs

Similar to Java, the Fortran files must be compiled to an executable ```.exe``` or ```.out``` and then run.

A simple example is below will create ```a.out``` by default onUnix and ```a.exe``` on Windows.

```shell
$ gfrotran example.f90
```

Or if you want to name your executable, run the flag ```-o```

```shell
$ gfrotran example.f90 -o example.out
```
