fcaseopen
=========

Case-insensitive `fopen` and `chdir` definition for case-sensitive file-systems.<br>
A dissection of the code and explanation of it.

Provides
--------

To be used outside function:
```c
const char* casepath(const char *path)
FILE* fcaseopen(char const *path, char const *mode)
void  casechdir(char const *path)
```
