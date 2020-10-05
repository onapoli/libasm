/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/03 15:25:44 by onapoli-          #+#    #+#             */
/*   Updated: 2020/10/05 11:48:08 by onapoli-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

extern size_t	ft_strlen(char *s);
extern ssize_t	ft_write(int fd, const void *buf, size_t count);
extern ssize_t	ft_read(int fd, void *buf, size_t count);
extern char		*ft_strcpy(char *dest, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strdup(const char *s);

int main(void)
{
	// ft_read VARIABLES
	int		r_fd;
	char	*r_file;
	char	*r_buf;
	size_t	r_buf_count;
	// ft_strcpy VARIABLES
	char	*dest;
	// ft_strdup VARIABLES
	char	*dup_src;
	char	*dup_s;

	/*
	** ft_strlen TESTS
	*/
	// When NULL is set as argument there's a SEGFAULT error in both ft_strlen & strlen 
	printf("ft_strlen result: %ld\n", ft_strlen("Hola"));
	printf("strlen result: %ld\n", strlen("Hola"));

	/*
	** ft_write TESTS
	*/
	printf("ft_write result: ");
	ft_write(1, "Hola\n", 5);
	printf("\nwrite result: ");
	write(1, "Hola\n", 5);

	/*
	** ft_read TESTS
	*/
	r_file = "hello.txt";
	r_buf_count = 4;
	if (!(r_buf = malloc(sizeof(char) * r_buf_count)))
		exit(EXIT_FAILURE);
	if ((r_fd = open(r_file, O_RDONLY)) < 0)
		exit(EXIT_FAILURE);
	printf("\nft_read result: %ld, ft_read_string: %s\n", ft_read(r_fd, r_buf, r_buf_count), r_buf);
	if (close(r_fd) < 0)
		exit(EXIT_FAILURE);
	if ((r_fd = open(r_file, O_RDONLY)) < 0)
		exit(EXIT_FAILURE);
	printf("read result: %ld, read_string: %s\n", ft_read(r_fd, r_buf, r_buf_count), r_buf);
	if (close(r_fd) < 0)
		exit(EXIT_FAILURE);
	free(r_buf);

	/*
	** ft_strcpy TESTS
	*/
	if (!(dest = malloc(sizeof(char) * (4 + 1))))
		exit(EXIT_FAILURE);
	printf("ft_strcpy result: %s\n", ft_strcpy(dest, "Hola"));
	printf("strcpy result: %s\n", strcpy(dest, "aloH"));
	free(dest);

	/*
	** ft_strcmp TESTS
	*/
	printf("ft_strcmp result: %d\n", ft_strcmp("Holas", "Hola"));
	printf("strcmp result: %d\n", strcmp("Holas", "Hola"));

	/*
	** ft_strdup TESTS
	*/
	// When NULL is set as argument there's a SEGFAULT error in both ft_strlen & strlen
	if (!(dup_src = malloc(sizeof(char) * (1 + 1))))
		exit(EXIT_FAILURE);
	dup_src[0] = 'a';
	dup_src[1] = 'b';
	dup_s = ft_strdup(dup_src);
	printf("ft_strdup string without NULL at the end result: %s\n", dup_s);
	free(dup_s);
	free(dup_src);

	dup_s = ft_strdup("Hola");
	printf("ft_strdup string with NULL at the end result: %s\n", dup_s);
	free(dup_s);

	if (!(dup_src = malloc(sizeof(char) * (1 + 1))))
		exit(EXIT_FAILURE);
	dup_src[0] = 'a';
	dup_src[1] = 'b';
	dup_s = strdup(dup_src);
	printf("strdup string without NULL at the end result: %s\n", dup_s);
	free(dup_s);
	free(dup_src);

	dup_s = strdup("Hola");
	printf("strdup string with NULL at the end result: %s\n", dup_s);
	free(dup_s);
	
	return (0);
}
