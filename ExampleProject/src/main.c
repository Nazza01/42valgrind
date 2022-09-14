/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/14 13:09:44 by Nathanael         #+#    #+#             */
/*   Updated: 2022/09/14 14:18:24 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mlx.h"
#include <stdio.h>

int	main(void)
{
	void	*mlx;
	void	*win;

	mlx = mlx_init();
	if (mlx != 0)
		printf("Cannot init mlx");
	win = mlx_new_window(mlx, 200, 200, "Hello World");
	mlx_loop(mlx);

	(void)win;
	return (0);
}
