---@meta

---Data card: hashing, encoding and compression (tier 1), encryption and random data (tier 2), elliptic curve cryptography (tier 3).\
---All binary results are returned as Lua strings.\
---Component type: `data`.
---@class ComponentData : Component
local card = {}

---The maximum size of data that can be passed to the other functions of the card.
---@return integer limit
function card.getLimit() end

---Applies base64 encoding to the data.
---@param data string
---@return string encoded
function card.encode64(data) end

---Applies base64 decoding to the data.
---@param data string
---@return string decoded
function card.decode64(data) end

---Applies deflate compression to the data.
---@param data string
---@return string compressed
function card.deflate(data) end

---Applies inflate decompression to the data.
---@param data string
---@return string decompressed
function card.inflate(data) end

---Computes the CRC-32 hash of the data. The result is binary data.
---@param data string
---@return string hash
function card.crc32(data) end

---Computes the MD5 hash of the data. The result is binary data.\
---`hmacKey` (tier 2+): compute an HMAC-MD5 with this key instead.
---@param data string
---@param hmacKey? string
---@return string hash
function card.md5(data, hmacKey) end

---Computes the SHA2-256 hash of the data. The result is binary data.\
---`hmacKey` (tier 2+): compute an HMAC-SHA256 with this key instead.
---@param data string
---@param hmacKey? string
---@return string hash
function card.sha256(data, hmacKey) end

---Encrypts data with AES (128-bit key and IV, CBC mode with PKCS5 padding). The result is binary data. Tier 2+.
---@param data string
---@param key string 16 bytes.
---@param iv string 16 bytes, preferably random (see `random`).
---@return string encrypted
function card.encrypt(data, key, iv) end

---Decrypts AES-encrypted data (see `encrypt`). Tier 2+.
---@param data string
---@param key string 16 bytes.
---@param iv string 16 bytes.
---@return string decrypted
function card.decrypt(data, key, iv) end

---Generates `len` bytes (1-1024) of secure random binary data. Tier 2+.
---@param len number
---@return string data
function card.random(len) end

---Generates a public/private key pair for elliptic curve cryptography. Tier 3.
---@param bitLen? 256|384 Key length in bits (default `384`).
---@return EcKeyPublic publicKey
---@return EcKeyPrivate privateKey
function card.generateKeyPair(bitLen) end

---Restores a key from its serialized string representation (see `EcKey.serialize`). Tier 3.
---@param data string
---@param type "ec-public"|"ec-private"
---@return EcKey key
function card.deserializeKey(data, type) end

---Generates a Diffie-Hellman shared key from a private and a public key:\
---`ecdh(a.private, b.public) == ecdh(b.private, a.public)`. Tier 3.
---@param privateKey EcKey A private key.
---@param publicKey EcKey A public key.
---@return string sharedKey
function card.ecdh(privateKey, publicKey) end

---Signs or verifies data. Tier 3.\
---`ecdsa(data, privateKey)` signs `data` and returns the signature (binary data).\
---`ecdsa(data, publicKey, sig)` verifies the signature and returns whether it is valid.
---@param data string
---@param key EcKey A private key.
---@return string signature
---@overload fun(data: string, key: EcKey, sig: string): boolean
function card.ecdsa(data, key) end

---An elliptic curve key returned by the tier 3 data card (userdata; call its methods with `.`).
---@class EcKey
local EcKey = {}

---Returns whether the key is public.
---@return boolean isPublic
function EcKey.isPublic() end

---Returns the type of the key: `"ec-public"` or `"ec-private"`.
---@return "ec-public"|"ec-private" keyType
function EcKey.keyType() end

---Returns the string representation of the key (binary data), for `data.deserializeKey`.
---@return string serialized
function EcKey.serialize() end

---A public elliptic curve key.
---@class EcKeyPublic : EcKey

---A private elliptic curve key.
---@class EcKeyPrivate : EcKey
