/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_set_param.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: irifarac <irifarac@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/30 11:36:40 by irifarac          #+#    #+#             */
/*   Updated: 2022/12/21 10:05:24 by irifarac         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/philo.h"

static void	ft_case(t_info *info, char **str, int nbr)
{
	if (nbr == 5)
		info->nb_e = ft_atoi(str[5]);
	else
		info->nb_e = -1;
}

static int	ft_check(t_info *info, int counter)
{
	int	i;

	i = -1;
	while (++i < counter)
	{
		if (info->nb_phi == -1)
			return (-1);
		else if (info->philo[i].time_d == -1)
			return (-1);
		else if (info->philo[i].time_e == -1)
			return (-1);
		else if (info->philo[i].time_s == -1)
			return (-1);
	}
	return (0);
}

int	ft_set_param(t_info *info, char **str, int nbr)
{
	int	i;
	int	counter;

	i = 0;
	counter = ft_atoi(str[1]);
	info->philo = malloc(sizeof(t_philo) * counter);
	if (!info->philo)
		ft_message("Malloc error\n", 0, NULL);
	while (i < counter)
	{
		info->nb_phi = ft_atoi(str[1]);
		info->philo[i].id = i + 1;
		info->philo[i].time_d = ft_atoi(str[2]);
		info->philo[i].time_e = ft_atoi(str[3]);
		info->philo[i].time_s = ft_atoi(str[4]);
		info->philo[i].right_fork = NULL;
		info->philo[i].status = 0;
		info->dead = 0;
		info->philo[i].info = info;
		info->philo[i].nb_e = 0;
		i++;
	}
	ft_case(info, str, nbr);
	return (ft_check(info, counter));
}
