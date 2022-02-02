fx_version 'adamant'

lua54 'yes'

game 'gta5'

description 'wujas kity'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'w_config.lua',
	'w_server/w_server.lua'
}

client_scripts {
	'w_client/w_client.lua',
	'w_config.lua',
}
