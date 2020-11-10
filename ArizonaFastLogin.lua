script_name('ARZ Fast Login')
script_author("rf0x3d")
require "lib.moonloader"
local sampev = require 'lib.samp.events'
local inicfg = require "inicfg"
local sha1 = require "sha1"
local basexx = require "basexx"
local band = bit.band

function genCode(skey)
    skey = basexx.from_base32(skey)
    value = math.floor(os.time() / 30)
    value = string.char(
        0,
        0,
        0,
        0,
        band(value, 0xFF000000) / 0x1000000,
        band(value, 0xFF0000) / 0x10000,
        band(value, 0xFF00) / 0x100,
        band(value, 0xFF)
    )
    local hash = sha1.hmac_binary(skey, value)
    local offset = band(hash:sub(-1):byte(1, 1), 0xF)
    local function bytesToInt(a,b,c,d)
        return a*0x1000000 + b*0x10000 + c*0x100 + d
    end
    hash = bytesToInt(hash:byte(offset + 1, offset + 4))
    hash = band(hash, 0x7FFFFFFF) % 1000000
    return ("%06d"):format(hash)
end

if not doesFileExist('moonloader\\config\\arz_fastlogin.ini') then
    if not doesDirectoryExist('moonloader\\config') then
        createDirectory('moonloader\\config')
    end
	local ini = {
		account1 = {
			user_name = '',
			user_password = '',
            gauth_secret = '',
            server_name = '',
		}
	}
	inicfg.save(ini, 'arz_fastlogin')
end

local config = inicfg.load(nil, "arz_fastlogin")

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
    if text:find('Добро пожаловать на {EBA225}Arizona Role Play') then
        name = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        for k, v in pairs(config) do
            if name == v['user_name'] and sampGetCurrentServerName():find(v['server_name']) then
                sampSendDialogResponse(dialogId, 1, -1, v['user_password'])
                printStringNow("Welcome, "..name, 3000)
                return false
            end
        end
    elseif text:find('К этому аккаунту подключено приложение {F1FC4C}Google Authenticator.') then
        name = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        for k, v in pairs(config) do
            if name == v['user_name'] and sampGetCurrentServerName():find(v['server_name']) then
                code = genCode(v['gauth_secret'])
                sampSendDialogResponse(dialogId, 1, -1, code)
                printStringNow("Welcome, "..name, 3000)
                return false
            end
        end
    end
end

function main()
	repeat wait(0) until isSampAvailable() and sampGetGamestate() == 3
	--if sampGetCurrentServerName():find("Gambit") then wait(0) else wait(-1) end
	wait(0)
end
