# dD5M Food Trucks
A FiveM Food Truck resource using ox_inventory and ox_lib.
**Discord** [https://discord.gg/t6WcBnpe9H](https://discord.gg/t6WcBnpe9H)

## ✨ Features
- Crafting stash
- Safe
- Unlimited food type menus
- Temporary employee system
- Per item crafting animations

## ⭐ Dependencies
- [https://github.com/overextended/ox_inventory](https://github.com/overextended/ox_inventory)
- [https://github.com/overextended/ox_lib](https://github.com/overextended/ox_lib)

## 🛠️ Installation
- Run the included sql to add the `foodtruck` column to your player_vehicles table.
- Add the ox_inventory item below to install foodtruck kitchen/register vehicle as a foodtruck.
- Add to `shared.lua` the vehicle models you intend to use as food trucks.
- Edit craftable food items, ingredients, and animations. (ingredients in default config are found in renewed-businesses.)

### Ox Inventory Item
- Required Items (You can disable recipe book requirement in each crafting recipe)
```
	['food_truck'] = {
		label = 'Install Kitchen',
		weight = 800,
		stack = false,
		close = true,
		consume = 1,
		client = {
			export = 'dd5m_foodtrucks.install'
		}
	},
    ['basic_recipes'] = {
		label = 'Basic Recipe Book',
		weight = 80,
	},
```

- Example reward items

```
	['ft_cola'] = {
		label = 'eCola(Food Truck)',
		weight = 350,
		client = {
			status = { thirst = 2000000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['ft_horchata'] = {
		label = 'Horchata(Food Truck)',
		weight = 350,
		client = {
			status = { thirst = 2000000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with Horchata'
		}
	},

	['ft_italiansoda'] = {
		label = 'Italian Soda(Food Truck)',
		weight = 350,
		client = {
			status = { thirst = 2000000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with Italian Soda'
		}
	},

	['ft_strawberryjuice'] = {
		label = 'Strawberry Juice(Food Truck)',
		weight = 350,
		client = {
			status = { thirst = 2000000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with Strawberry Juice'
		}
	},

	['ft_burrito'] = {
		label = 'Burrito(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Burrito'
		},
	},

	['ft_quesadilla'] = {
		label = 'Quesadilla(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Quesadilla'
		},
	},

	['ft_spaghetti'] = {
		label = 'Spaghetti(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Spaghetti'
		},
	},

	['ft_pizza'] = {
		label = 'Pizza(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Pizza'
		},
	},

	['ft_ramen'] = {
		label = 'Ramen(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Ramen'
		},
	},

	['ft_potstickers'] = {
		label = 'Potstickers(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Potstickers'
		},
	},

	['ft_burger'] = {
		label = 'Burger(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Burger'
		},
	},

	['ft_cheesesticks'] = {
		label = 'Fried Cheesesticks(Food Truck)',
		weight = 220,
		client = {
			status = { hunger = 2000000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Fried Cheesesticks'
		},
	},
```

## 🆘 Support
- **Discord** [https://discord.gg/t6WcBnpe9H](https://discord.gg/t6WcBnpe9H)