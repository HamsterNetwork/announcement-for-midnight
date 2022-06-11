local files = {}
function files.load_file(path)
    file = io.open(path, "r")
    text = file:read("*a")
    file:close()
    return text
end
function files.append_file(path,text)
    file = io.open(path, "a")
    file:write(text)
    file:close()
end
function files.write_file(path,text)
    file = io.open(path, "w+")
    file:write(text)
    file:close()
    
end
return files