# fortran
Working with Fortran Programming Language

https://gcc.gnu.org/wiki/GFortranGettingStarted

## Installation and Set up

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

Exploring the gcc PATH for the Homebrew gave: ```usr/local/Cellar/``` So all that needed to be done to have the gcc point to the Homebrew's version would be to add a PATH that points to it in the <em><p5><strong><em>end</em></strong></p5> of the ```.bash_profile``` file.

In ```.bash_profile``` I added:
```PATH=/usr/local/Cellar/gcc/9.3.0/bin:$PATH```

And now all is good and I can successfully compile my first Fortran script!

---

## Compiling Fortran Programs

Similar to Java, the Fortran files must be compiled to an executable and then run.

A simple example is below will create ```a.out``` by default on Unix and ```a.exe``` on Windows:

```shell
$ gfrotran example.f90
```

Or if you want to name your executable, run the flag ```-o``` after the file and then followed by what you want to call it:

```shell
$ gfrotran example.f90 -o example.out
```

Now that you have a executable file, it just needs to be run as one: (the path to the file needs to be used then the executable)
* If the Fortran file is in your current working directory, a simple ```./``` just needs to be used with the executbale.

```shell
$ ./example.out.
```

And that's it!

---

## Arrays

To declare an array the attribute ```DIMENSION``` is used. Then calling the index to assign a value ```array_name(index_num)=value```.
Unlike some languages, Fortran is a 1st index language, so the first indicie will need to be 1 and not 0.

```fortran
INTEGER, DIMENSION(8) :: vert_press_levels
vert_press_levels(1)=1000
.
.
.
vert_press_levels(8)=250
```

See the ```arrays.f90``` script for a quick example.

Similar to Python, the array can be referenced by indicies by <strong>indiviudal element</strong>, <strong>entire array</strong>, or <strong>subset</strong>.

<ol>
    <li>Indiviudal Element:</li>
        <ul>
            array(1), array(-1), etc.
        </ul>
    <li>Entire Array:</li>
        <ul>
            array, array(:), etc.
        </ul>
    <li>Subset:</li>
        <ul>
            array(1:20), array(-20:-10), etc.
        </ul>
</ol>

---

## tfuhg

