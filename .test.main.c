#include <string.h>
#include <stdio.h>

void test_strcmp(char *str, char *str2) {
	printf("strcmp(%s, %s) = %i\n", str, str2, strcmp(str, str2));
}

void test_strncmp(char *str, char *str2, int size) {
	printf("strncmp(%s, %s, %i) = %i\n", str, str2, size, strncmp(str, str2, size));
}

void test_strcasecmp(char *str, char *str2) {
	printf("strcasecmp(%s, %s) = %i\n", str, str2, strcasecmp(str, str2));
}

int main(int ac, char **av) {
	char *str = strdup("sahel est vraiment trop fort");

	long unsigned int len = strlen(str);
	printf("len: %lu\n", len);

	char *c = strchr(str, 's');
	printf("strchr(s): %s\n", c);

	printf("memset (%%i): ");
	str = memset(str, 0, strlen(str));
	for (unsigned int i = 0; i < len; i++) {
		printf("%i", str[i]);
	}
	printf("\n");

	str = memcpy(str, "Sahel est vraiment trop fort", 28);
	printf("strcpy: %s\n", str);

	test_strcmp("abcdef", "abcdef");
	test_strcmp("abcdef", "000bcdef");
	test_strcmp("abcdef", "");
	test_strcmp("abcdef", "a");

	str = memmove(str, "Vincent est le meilleur", 24);
	printf("memmove: %s\n", str);

	test_strncmp("abcdef", "abcdf", 4);
	test_strncmp("abcdef", "abcdf", 5);
	test_strncmp("", "", 4);
	test_strncmp("", "abcdef", 10);
	test_strncmp("abcdef", "", 10);

	test_strcasecmp("ABCDEF", "ABCDEF");
	test_strcasecmp("ABCDEF", "abcdef");
	test_strcasecmp("", "ABCDEF");

	char *s1 = rindex(str, 'V');
	char *s2 = rindex(str, 't');
	char *s3 = rindex(str, 'z');

	printf("rindex(V) = %s\n", s1);
	printf("rindex(t) = %s\n", s2);
	printf("rindex(z) = %s\n", s3);

	s1 = strstr(str, "V");
	s2 = strstr(str, "m");
	s3 = strstr(str, "cent");
	char *s4 = strstr(str, "est");
	char *s5 = strstr(str, "estz");
	char *s6 = strstr(str, "");
	char *s7 = strstr("", "a");

	printf("strstr: %s\n", s1);
	printf("strstr: %s\n", s2);
	printf("strstr: %s\n", s3);
	printf("strstr: %s\n", s4);
	printf("strstr: %s\n", s5);
	printf("strstr: %s\n", s6);
	printf("strstr: %s\n", s7);

	printf("strpbrk: %s\n", strpbrk(str, "a"));
	printf("strpbrk: %s\n", strpbrk(str, "ze"));
	printf("strpbrk: %s\n", strpbrk(str, "zzz"));
	printf("strpbrk: %s\n", strpbrk(str, "cent"));
	printf("strpbrk: %s\n", strpbrk(str, "e"));

	printf("strcspn %lu\n", strcspn(str, "Vincent"));
	printf("strcspn %lu\n", strcspn(str, "bonjour je "));
	printf("strcspn %lu\n", strcspn(str, "abcdefghijklmnoqrstuvwxyz "));
	printf("strcspn %lu\n", strcspn(str, "a"));
	printf("strcspn %lu\n", strcspn(str, "lolqsd"));
}