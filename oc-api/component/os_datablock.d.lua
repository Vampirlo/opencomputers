---@meta

---Data Block (OpenSecurity): the tier 1 data card functions as a block, plus rot13 and bcrypt.
---Note: in OpenSecurity 1.0-93 the block's network node is never exposed (a field shadows it),
---so this component may not show up in game at all.
---@class ComponentOsDataBlock : Component
local os_datablock = {}

---Returns a fixed greeting string (easter egg inherited by every OpenSecurity component). (signature inferred)
---@return string greeting
function os_datablock.greet()
end

---The maximum size of data that can be passed to other functions of the block.
---@return number limit
function os_datablock.getLimit()
end

---Applies base64 encoding to the data.
---@param data string
---@return string encoded
function os_datablock.encode64(data)
end

---Applies base64 decoding to the data.
---@param data string
---@return string decoded
function os_datablock.decode64(data)
end

---Applies deflate compression to the data.
---@param data string
---@return string compressed
function os_datablock.deflate(data)
end

---Applies inflate decompression to the data.
---@param data string
---@return string decompressed
function os_datablock.inflate(data)
end

---Computes SHA2-256 hash of the data. Result is in binary format.
---@param data string
---@return string hash
function os_datablock.sha256(data)
end

---Computes MD5 hash of the data. Result is in binary format.
---@param data string
---@return string hash
function os_datablock.md5(data)
end

---Computes CRC-32 hash of the data. Result is in binary format.
---@param data string
---@return string hash
function os_datablock.crc32(data)
end

---Applies rot13 to the data.
---@param data string
---@return string result
function os_datablock.rot13(data)
end

---Computes the bcrypt hash of the plain text, optionally with the given number of rounds (4-15, default 10).
---@param plainText string
---@param rounds? number
---@return string hash
function os_datablock.bCryptHash(plainText, rounds)
end

---Checks the plain text against a bcrypt hash.
---@param plainText string
---@param hash string
---@return boolean matches
function os_datablock.bCryptCheck(plainText, hash)
end
