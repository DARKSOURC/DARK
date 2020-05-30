serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_DarK = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_DarK = function() 
local Create_Info = function(Token,Sudo,UserName)  
local DarK_Info_Sudo = io.open("sudo.lua", 'w')
DarK_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

]])
DarK_Info_Sudo:close()
end  
if not database:get(Server_DarK.."Token_DarK") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_DarK.."Token_DarK",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua run.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_DarK.."Id_DarK") then
print("\27[1;34m\n»» Send Your id Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
io.write('\n\27[1;31m»» The id Is Saved\n\27[0;39;49m')
database:set(Server_DarK.."Id_DarK",UserName)
else
io.write('\n\27[1;31mThe id was not Saved\n\27[0;39;49m')
end 
os.execute('lua run.lua')
end
local function Files_DarK_Info()
Create_Info(database:get(Server_DarK.."Token_DarK"),database:get(Server_DarK.."Id_DarK"),database:get(Server_DarK.."UserName_DarK"))   
local RunDarK = io.open("DarK", 'w')
RunDarK:write([[
#!/usr/bin/env bash
cd $HOME/DarK
token="]]..database:get(Server_DarK.."Token_DarK")..[["
while(true) do
rm -fr ../.telegram-cli
./tg -s ./DarK.lua -p PROFILE --bot=$token
done
]])
RunDarK:close()
local RunTs = io.open("run", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/DarK
while(true) do
rm -fr ../.telegram-cli
screen -S DarK -X kill
screen -S DarK ./DarK
done
]])
RunTs:close()
end
Files_DarK_Info()
database:del(Server_DarK.."Token_DarK");database:del(Server_DarK.."Id_DarK");database:del(Server_DarK.."UserName_DarK")
sudos = dofile('sudo.lua')
os.execute('./ins.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_DarK()  
var = true
else   
f:close()  
database:del(Server_DarK.."Token_DarK");database:del(Server_DarK.."Id_DarK");database:del(Server_DarK.."UserName_DarK")
sudos = dofile('sudo.lua')
os.execute('./ins.sh ins')
var = false
end  
return var
end
Load_File()
