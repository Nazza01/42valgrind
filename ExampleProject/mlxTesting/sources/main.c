/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/14 13:09:44 by Nathanael         #+#    #+#             */
/*   Updated: 2022/09/20 22:45:31 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mlx.h"
#include "libft.h"

#include <stdio.h>
#include <stdlib.h>

typedef struct s_mlx
{
	void	*mlx;
	void	*win;
}	t_mlx;

static int	sl_exit(t_mlx *mlx)
{
	exit(0);
}

int	main(void)
{
	t_mlx	*mlx = malloc(sizeof(t_mlx));

	mlx->mlx = mlx_init();
	mlx->win = mlx_new_window(mlx->mlx, 200, 200, "Hello World");
	ft_putstr_fd("Hello There!", 1);
	mlx_key_hook(mlx->win, sl_exit, &mlx);
	mlx_hook(mlx->win, 17, 0, sl_exit, &mlx);
	mlx_loop(mlx->mlx);
	return (0);
}
