fx_version 'cerulean'
game 'gta5'

author 'Snipe'
description 'Script for changing billboard textures'
version '1.0.0'

lua54 'yes'

ui_page "html/index.html"

shared_scripts{
	'config.lua',
}

server_scripts {
	'server/server.lua',
    'server/sv_customise.lua',
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/client.lua',
	'client/target.lua',
	'client/utils.lua',
}

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}

escrow_ignore{
	'config.lua',
    'client/target.lua',
    'server/sv_customise.lua',
}

