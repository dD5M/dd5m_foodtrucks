fx_version 'cerulean'
game 'gta5'

name 'DD5M Food Trucks'
author 'daddyDUBZ'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'config/shared.lua'
}

client_scripts{
	'@qbx_core/modules/playerdata.lua',
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
}

files {
	'config/shared.lua',
	'@ox_inventory/web/images/*.png'
}

dependencies {
	'ox_lib',
	'ox_inventory'
}

lua54 'yes'