/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/14 13:09:44 by Nathanael         #+#    #+#             */
/*   Updated: 2022/09/17 22:34:14 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mlx.h"
#include <stdio.h>
#include <stdlib.h>

int	main(void)
{
	void	*mlx;
	void	*win;

	mlx = mlx_init();
	if (mlx != 0)
	{
		printf("Cannot init mlx\n");
		exit(1);
	}
	win = mlx_new_window(mlx, 200, 200, "Hello World");
	if (win != 0)
	{
		printf("Cannot make a mlx window!\n");
		exit(1);
	}
	mlx_loop(mlx);
	return (0);
}
