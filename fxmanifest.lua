fx_version 'cerulean'

games { 'gta5' }

description 'mz-scoreboard - a simple and minimalist style scoreboard for qb-core'

version '1.0.0'

author 'Mr_Zain#4139'

ui_page 'html/index.html'

client_script 'client/main.lua'

server_script 'server/main.lua'

shared_scripts {
    'shared/*',
}

lua54 'yes'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/script.js'
}