fcaseopen
=========

Case-insensitive `fopen` and `chdir` definition for case-sensitive file-systems.<br>
A dissection of the code and explanation of it.

Provides
--------

To be used outside function:
```c
FILE* fcaseopen(char const *path, char const *mode)
void  casechdir(char const *path)
```
