#ifndef FCASEOPEN_HEADER
#define FCASEOPEN_HEADER

#include <stdio.h>

#if defined(__cplusplus)
extern "C" {
#endif

extern const char* casepath(char const *path);
extern FILE* fcaseopen(char const *path, char const *mode);
extern void casechdir(char const *path);

#if defined(__cplusplus)
}
#endif

#endif
