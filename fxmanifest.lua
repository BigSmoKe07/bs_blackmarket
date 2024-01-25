fx_version 'cerulean'
game 'gta5'

name         'bs_blackmarket'
author       'BigSmoke07'
version      '1.0.0'
license      'LGPL-3.0-or-later'
repository   'https://github.com/BigSmoKe07/bs_blackmarket'



shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua'
}

files {
    'config.lua',
    'utils.lua'
}
dependency 'ox_lib'

lua54 'yes'
use_experimental_fxv2_oal 'yes'