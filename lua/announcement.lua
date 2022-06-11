local time = system.time() + 10
local json = require("lib/json")
local files = require("lib/files")
local config = nil
function OnFrame()
    config = json.decode(files.load_file(fs.get_dir_product().."config/auto rejoin session/config.json"))
    if config["enable"] then
        if config["type"] == "chat" then
            for i=1,#config["notices"] do
                if time < system.time() then
                    utils.send_chat(config["notices"][i], false)
                    time = system.time() + config["interval"]
                end
            end
        elseif config["type"] == "sms" then
            local players = player.get_hosts_queue()
            for i=1,#players do
                for x=1,#config["notices"] do
                    if time < system.time() then
                        player.send_sms(players[i], utils.send_chat(config["notices"][x], false))
                        time = system.time() + config["interval"]
                    end
                end
            end
        end
    end
end