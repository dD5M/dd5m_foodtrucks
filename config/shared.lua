--[[
################################################################################################################################
################################################################################################################################
##########################              resource: dd5m_Menutrucks author: daddyDUBZ                   ##########################
##########################                   A FiveM/Ox_Inventory mask resource.                      ##########################
################################################################################################################################
##########################################                                             #########################################
##########################################        /$$ /$$$$$$$  /$$$$$$$  /$$      /$$ #########################################
##########################################       | $$| $$__  $$| $$____/ | $$$    /$$$ #########################################
##########################################   /$$$$$$$| $$  \ $$| $$      | $$$$  /$$$$ #########################################
##########################################  /$$__  $$| $$  | $$| $$$$$$$ | $$ $$/$$ $$ #########################################
########################################## | $$  | $$| $$  | $$|_____  $$| $$  $$$| $$ #########################################
########################################## | $$  | $$| $$  | $$ /$$  \ $$| $$\  $ | $$ #########################################
########################################## |  $$$$$$$| $$$$$$$/|  $$$$$$/| $$ \/  | $$ #########################################
##########################################                                             #########################################           
################################################################################################################################
###########################     For support reach out in discord. https://discord.gg/t6WcBnpe9H    #############################
################################################################################################################################
################################################################################################################################
--]]

return {
    whitelist = {
        model = {
            'fdtruck',
            'fdtruck2',
            'fdtruckw',
            'taco',
            'ramentruck'
        },
    },
    
    installTime = 5000,
    tempEmployees = true,
    employeeStashAccess = true,

    menuTypes = {
        ['mexican'] = {
            menuTitle = 'Mexican Food',
            menuDescription = 'Burritos and things!',
            menuIcon = 'fa-solid fa-pepper-hot',
            items = {
                {
                    itemID = 'ft_burrito',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Burrito',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'filet', count = 1},
                        {item = 'tomato', count = 1},
                        {item = 'cheddar', count = 1},
                        {item = 'flatbread', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_quesadilla',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Quesadilla',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'cheddar', count = 1},
                        {item = 'flatbread', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_cola',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'eCola',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
                {
                    itemID = 'ft_horchata',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'Horchata',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                }
            },
        },
        ['italian'] = {
            menuTitle = 'Italian Food',
            menuDescription = 'Pasta n Pie!',
            menuIcon = 'fa-solid fa-pizza-slice',
            items = {
                {
                    itemID = 'ft_spaghetti',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Spaghetti',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'tomato', count = 1},
                        {item = 'spaghetti', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_pizza',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Pizza',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'bacon', count = 1},
                        {item = 'tomato', count = 1},
                        {item = 'mozzarella', count = 1},
                        {item = 'pizzadough', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_cola',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'eCola',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
                {
                    itemID = 'ft_italiansoda',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'Italian Soda',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
            },
        },
        ['chinese'] = {
            menuTitle = 'Chinese Food',
            menuDescription = 'Noodles n Dumplings',
            menuIcon = 'fa-solid fa-bowl-food',
            items = {
                {
                    itemID = 'ft_ramen',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Ramen',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'wholeham', count = 1},
                        {item = 'butter', count = 1},
                        {item = 'onionpowder', count = 1},
                        {item = 'ramen', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_potstickers',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Potstickers',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'roastbeef', count = 1},
                        {item = 'flour', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_cola',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'eCola',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
                {
                    itemID = 'ft_strawberryjuice',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'Strawberry Juice',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'strawberry', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
            },
        },
        ['american'] = {
            menuTitle = 'American Food',
            menuDescription = 'Burgers and basic ish!',
            menuIcon = 'fa-solid fa-burger',
            items = {
                {
                    itemID = 'ft_burger',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Burger',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'frozenbeefpatty', count = 1},
                        {item = 'tomato', count = 1},
                        {item = 'cheddar', count = 1},
                        {item = 'burgerbuns', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_cheesesticks',
                    rewardCount = 5,
                    itemCategory = 'food',
                    menuLabel = 'Fried Cheesesticks',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'mozzarella', count = 1},
                        {item = 'flour', count = 1},
                    },
                    craftAnim = {
                        dict = 'amb@prop_human_bbq@male@idle_a',
                        clip = 'idle_b',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_fish_slice_01',
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0),
                        bone = 28422,
                    }
                },
                {
                    itemID = 'ft_cola',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'eCola',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'sugar', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                },
                {
                    itemID = 'ft_strawberryjuice',
                    rewardCount = 5,
                    itemCategory = 'drink',
                    menuLabel = 'Strawberry Juice',
                    recipeItem = 'basic_recipes',
                    craftTime = 5000,
                    ingredients = {
                        {item = 'strawberry', count = 1},
                    },
                    craftAnim = {
                        dict = 'missfam4',
                        clip = 'base',
                        flag = 49,
                    },
                    craftProp = {
                        model = 'prop_cs_paper_cup',
                        pos = vec3(0.05, 0.04, 0.02),
                        rot = vec3(-99.0, 0.0, 0.0),
                        bone = 36029,
                    }
                }
            }
        }
    }
}