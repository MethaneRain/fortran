Working with Fortran Programming Language via ```gfortran``` Compiler

https://gcc.gnu.org/wiki/GFortranGettingStarted

## Installation and Set up

This was an interesting program to setup on my own and I'll try my best to document it here. 

I set Fortran up on a Mac running Mojave 10.14.6

### So many compiler errors....

First thing I realized was I was probably a little over my head on the installation but I was able to power through with the help of merciless Google research and forum searching like Stack Overflow, etc.

I had gcc and gfortan installed a while back. However, when trying to compile a simple ```f90``` I immediately ran into a plethora of errors. 

After tracking down what the errors were, I realized that I was using the Macports version of gcc and gfortran which was 5.5.0. So the next step was to get the most updated versions, and instead of using Macports, I went with Homebrew. 

```brew install gcc```

Which gave gfortran version of 9.3.0, but when running ```gfortran --version``` I continued to get back the Macports version of 5.5.0. Ugg, so the response was to alter the PATH variable to override the default Macports.

The Macports PATH an be viewed by opening the ```.bash_profile```
```shell
atom ~/.bash_profile
```

The Macports PATH was: ```"/opt/local/bin:/opt/local/sbin:$PATH"```

Exploring the gcc PATH for the Homebrew gave: ```usr/local/Cellar/``` So all that needed to be done to have the gcc point to the Homebrew's version would be to add a PATH that points to it in the <p5><strong><em>end</em></strong></p5> of the ```.bash_profile``` file.

In ```.bash_profile``` I added:
```PATH=/usr/local/Cellar/gcc/9.3.0/bin:$PATH```

Then reload the ```.bash_profile```

```$source ~/.bash_profile```

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

## Basic Syntax (this will be covered more throughout the examples)

Similiar to Java, all variables must be declared before being assigned with a value. In Fortran this is done by declaring the data type, then two colons, then the name of the variable and optional value.

```fortran
integer :: a
real :: b
a = 3
b = 15.0
```

Multiple variables can be declared at once as long as they are the same data type:

```fortran
real :: a,b,c
a = 1.0
b = 2.0
c = a+b
```

Stings need to be called by ```character``` and must be declared with the length. There are ways around this, but here is a basic example:

```fortran
character(len=20) :: name
name  = "Albert Einstein"
```
The character length can be assigned larger than needed and trimmed to the actual length with ```trim()```:

```fortran
program string_example
  implicit none
  character(len=20) :: name
  name  = "Albert Einstein"
  print *,"Number of characters in variable name:",len(name)
  print *,"Number of characters in trimmed variable name:",len(trim(name))
end program string_example

>>>
Number of characters in variable name: 20
Number of characters in trimmed variable name: 15
```

Variable names (Identifiers) must follow certain rules:
<ol>
    <li>First character must be a letter</li>
    <li>Must contain letter (a-z), numbers (0-9), or underscores</li>
    <li>Length must be less then 31 characters long</li>
</ol>

* One interesting note is that unlike in other programming languages like Python, Fortran variable names are <strong><em>case insensitive!</strong></em> Thus, identifiers like ```name```, ```Name```, ```nAmE```, etc are all equivalent!

Fortran Keywords (reserved names; not for use as variable names)

<html>
<table style="text-align:center;" class="table table-bordered">
<tbody><tr>
<th style="text-align:center;" colspan="5">The non-I/O keywords</th>
</tr>
<tr>
<td>allocatable</td>
<td>allocate</td>
<td>assign</td>
<td>assignment</td>
<td>block data</td>
</tr>
<tr>
<td>call</td>
<td>case</td>
<td>character</td>
<td>common</td>
<td>complex</td>
</tr>
<tr>
<td>contains</td>
<td>continue</td>
<td>cycle</td>
<td>data</td>
<td>deallocate</td>
</tr>
<tr>
<td>default</td>
<td>do</td>
<td>double precision</td>
<td>else</td>
<td>else if</td>
</tr>
<tr>
<td>elsewhere</td>
<td>end block data</td>
<td>end do</td>
<td>end function</td>
<td>end if</td>
</tr>
<tr>
<td>end interface</td>
<td>end module</td>
<td>end program</td>
<td>end select</td>
<td>end subroutine</td>
</tr>
<tr>
<td>end type</td>
<td>end where</td>
<td>entry</td>
<td>equivalence</td>
<td>exit</td>
</tr>
<tr>
<td>external</td>
<td>function</td>
<td>go to</td>
<td>if </td>
<td>implicit</td>
</tr>
<tr>
<td>in</td>
<td>inout</td>
<td>integer</td>
<td>intent</td>
<td>interface</td>
</tr>
<tr>
<td>intrinsic</td>
<td>kind</td>
<td>len</td>
<td>logical</td>
<td>module</td>
</tr>
<tr>
<td>namelist</td>
<td>nullify</td>
<td>only</td>
<td>operator</td>
<td>optional</td>
</tr>
<tr>
<td>out</td>
<td>parameter</td>
<td>pause</td>
<td>pointer</td>
<td>private</td>
</tr>
<tr>
<td>program</td>
<td>public</td>
<td>real</td>
<td>recursive</td>
<td>result</td>
</tr>
<tr>
<td>return</td>
<td>save</td>
<td>select case</td>
<td>stop</td>
<td>subroutine</td>
</tr>
<tr>
<td>target</td>
<td>then</td>
<td>type</td>
<td>type()</td>
<td>use</td>
</tr>
<tr>
<td>Where</td>
<td>While</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th style="text-align:center;" colspan="5">The I/O related keywords</th>
</tr>
<tr>
<td>backspace</td>
<td>close</td>
<td>endfile</td>
<td>format</td>
<td>inquire</td>
</tr>
<tr>
<td>open</td>
<td>print</td>
<td>read</td>
<td>rewind</td>
<td>Write</td>
</tr>
</tbody></table>
</html>

---

## Fortran Program

A Fortran program is made of a collection of: <strong><em>main program</strong></em>, <strong><em>modules</strong></em>, and <strong><em>external subprograms/proceedures</strong></em>

One of the first noticable quirks of Fortran is the way it handles variables that start with i, j, k, l, m, and n. By default Fortran will assign these variables to ```integers```, while any variable name that starts with any other letter will be assigned to ```real```, or float (covered in data types later).

To override this inherit behavior, at the very beginning of the program, the statement ```implicit none``` must be added to the script.

Every Fortran script must start with a program name and eventually end with the same name. However, the name you call the program <strong><em>does not</strong></em> have to be the name of the script.

For example, in the script ```example.f90```:

```fortran
program test
    impilcit none
    [executable statements]
end program test
```


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

## 

