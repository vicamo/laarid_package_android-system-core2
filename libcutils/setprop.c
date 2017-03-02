#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <cutils/properties.h>

int main(int argc, const char* argv[])
{
  if (argc < 3) {
    fprintf(stderr, "insufficient arguments\n");
    exit(EXIT_FAILURE);
  }

  const char *name = argv[1], *value = argv[2];
  const char *p;
  size_t name_len = strlen(name), value_len = strlen(value);

  // property_set doesn't tell us why it failed, and actually can't
  // recognize most failures (because it doesn't wait for init), so
  // we duplicate all of init's checks here to help the user.

  if (name_len >= PROPERTY_KEY_MAX) {
    fprintf(stderr, "name '%s' too long; try '%.*s'\n",
            name, PROPERTY_KEY_MAX - 1, name);
    exit(EXIT_FAILURE);
  }
  if (value_len >= PROPERTY_VALUE_MAX) {
    fprintf(stderr, "value '%s' too long; try '%.*s'\n",
            value, PROPERTY_VALUE_MAX - 1, value);
    exit(EXIT_FAILURE);
  }

  if (*name == '.' || name[name_len - 1] == '.') {
    fprintf(stderr, "property names must not start or end with '.'\n");
    exit(EXIT_FAILURE);
  }
  if (strstr(name, "..")) {
    fprintf(stderr, "'..' is not allowed in a property name\n");
    exit(EXIT_FAILURE);
  }
  for (p = name; *p; ++p) {
    if (!isalnum(*p) && !strchr("_.-", *p)) {
      fprintf(stderr, "invalid character '%c' in name '%s'\n", *p, name);
      exit(EXIT_FAILURE);
    }
  }

  if (property_set(name, value)) {
    fprintf(stderr, "failed to set property '%s' to '%s'\n", name, value);
    exit(EXIT_FAILURE);
  }

  return 0;
}
