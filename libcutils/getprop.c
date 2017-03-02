#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <cutils/properties.h>

static size_t size;
static char **nv; // name/value pairs: even=name, odd=value

static void add_property(char *name, char *value, void *unused)
{
  if (!(size&31)) nv = realloc(nv, (size+32)*2*sizeof(char *));

  nv[2*size] = strdup(name);
  nv[1+2*size++] = strdup(value);
}

static int qstrcmp(const void *a, const void *b)
{
  return strcmp(*(char **)a, *(char **)b);
}

int main(int argc, const char* argv[])
{
  if (argc > 1) {
    char value[PROPERTY_VALUE_MAX];

    property_get(argv[1], value, argc > 2 ? argv[2] : "");
    puts(value);
  } else {
    size_t i;

    if (property_list((void *)add_property, 0)) {
      fprintf(stderr, "property_list\n");
      exit(EXIT_FAILURE);
    }

    qsort(nv, size, 2*sizeof(char *), qstrcmp);
    for (i = 0; i<size; i++)
      printf("[%s]: [%s]\n", nv[i*2], nv[1+i*2]);
    for (i = 0; i<size; i++) {
      free(nv[i*2]);
      free(nv[1+i*2]);
    }
    free(nv);
  }

  return 0;
}
