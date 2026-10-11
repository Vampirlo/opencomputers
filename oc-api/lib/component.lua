---@meta

---Base class of all component proxies.
---@class Component
---@field address string The component's full address.
---@field type string The component's type name, e.g. `"gpu"`.
---@field slot integer The slot the component is installed in, or `-1` if that doesn't apply.

---Result of `component.list()`: a table mapping component addresses to their type names.\
---It can also be called as an iterator: `for address, componentType in component.list("gpu") do ... end`,\
---and a single call returns the first match: `component.list("gpu")()`.
---@class ComponentList
---@field [string] string
---@overload fun(): string, string

---The component API is used to access and interact with components available to a computer.\
---`component.<type>` returns the proxy of the primary component of that type and throws an error if there is none,
---e.g. `component.gpu.set(1, 1, "Hi")`. Check with `component.isAvailable("gpu")` first if it may be missing.
---@class componentlib
---@field assembler ComponentAssembler
---@field barcode_reader ComponentBarcodeReader
---@field beacon ComponentBeacon Adapter: Beacon
---@field brewing_stand ComponentBrewingStand Adapter: Brewing Stand
---@field chunkloader ComponentChunkloader
---@field command_block ComponentCommandBlock Adapter: Command Block
---@field comparator ComponentComparator Adapter: Redstone Comparator
---@field computer ComponentComputer
---@field crafting ComponentCrafting
---@field data ComponentData
---@field database ComponentDatabase
---@field debug ComponentDebug
---@field disk_drive ComponentDiskDrive
---@field drive ComponentDrive
---@field drone ComponentDrone
---@field eeprom ComponentEEPROM
---@field energy_device ComponentEnergyDevice Adapter: any block storing Forge Energy (RF)
---@field experience ComponentExperience
---@field filesystem ComponentFilesystem
---@field furnace ComponentFurnace Adapter: Furnace
---@field generator ComponentGenerator
---@field geolyzer ComponentGeolyzer
---@field gpu ComponentGPU
---@field hologram ComponentHologram
---@field internet ComponentInternet
---@field inventory_controller ComponentInventoryController
---@field jukebox ComponentJukebox Adapter: Jukebox
---@field keyboard ComponentKeyboard
---@field leash ComponentLeash
---@field microcontroller ComponentMicrocontroller
---@field mob_spawner ComponentMobSpawner Adapter: Mob Spawner
---@field modem ComponentModem
---@field motion_sensor ComponentMotionSensor
---@field navigation ComponentNavigation
---@field net_splitter ComponentNetSplitter
---@field note_block ComponentNoteBlock Adapter: Note Block
---@field piston ComponentPiston
---@field printer3d ComponentPrinter3D
---@field redstone ComponentRedstone
---@field relay ComponentRelay
---@field robot ComponentRobot
---@field screen ComponentScreen
---@field sign ComponentSign
---@field tablet ComponentTablet
---@field tank_controller ComponentTankController
---@field tractor_beam ComponentTractorBeam
---@field trading ComponentTrading
---@field transposer ComponentTransposer
---@field tunnel ComponentTunnel
---@field waypoint ComponentWaypoint
---@field os_alarm ComponentOsAlarm OpenSecurity: Alarm
---@field os_biometric ComponentOsBiometric OpenSecurity: Biometric Reader
---@field os_cardwriter ComponentOsCardWriter OpenSecurity: Card Writer
---@field os_datablock ComponentOsDataBlock OpenSecurity: Data Block
---@field os_doorcontroller ComponentOsDoorController OpenSecurity: Door Controller
---@field os_energyturret ComponentOsEnergyTurret OpenSecurity: Energy Turret
---@field os_entdetector ComponentOsEntDetector OpenSecurity: Entity Detector
---@field os_keypad ComponentOsKeypad OpenSecurity: Keypad
---@field os_magreader ComponentOsMagReader OpenSecurity: Mag Card Reader
---@field os_nanofog_terminal ComponentOsNanoFogTerminal OpenSecurity: NanoFog Terminal
---@field os_rfidreader ComponentOsRFIDReader OpenSecurity: RFID Reader
---@field os_rolldoorcontroller ComponentOsRolldoorController OpenSecurity: Rolldoor Controller
---@field os_securityterminal ComponentOsSecurityTerminal OpenSecurity: Security Terminal
---@field average_counter ComponentAverageCounter Energy Control: Average Counter
---@field energy_counter ComponentEnergyCounter Energy Control: Energy Counter
---@field howler_alarm ComponentHowlerAlarm Energy Control: Howler / Industrial Alarm
---@field info_panel ComponentInfoPanel Energy Control: Info Panel / Holo Panel
---@field info_panel_advanced ComponentInfoPanelAdvanced Energy Control: Advanced Info Panel
---@field thermal_monitor ComponentThermalMonitor Energy Control: Thermal Monitor
---@field ic2_te_batbox ComponentIC2Energy IndustrialCraft 2: BatBox
---@field ic2_te_cesu ComponentIC2Energy IndustrialCraft 2: CESU
---@field ic2_te_mfe ComponentIC2Energy IndustrialCraft 2: MFE
---@field ic2_te_mfsu ComponentIC2Energy IndustrialCraft 2: MFSU
---@field mass_fab ComponentMassFab IndustrialCraft 2: Mass Fabricator
---@field reactor ComponentReactor IndustrialCraft 2: Nuclear Reactor
---@field reactor_chamber ComponentReactorChamber IndustrialCraft 2: Reactor Chamber / Reactor Redstone Port
---@field worldspike ComponentWorldspike Railcraft: Worldspike
local component = {}

---Returns the documentation string for the method with the specified name of the component with the specified address, if any.\
---You can also get this string by calling `tostring` on a method of a proxy, e.g. `tostring(component.screen.isOn)`.
---@param address string
---@param method string
---@return string|nil documentation
function component.doc(address, method) end

---Calls the method with the specified name on the component with the specified address, passing the remaining arguments to that method.\
---Returns the values returned by the method. Depending on the method's implementation this may throw.
---@param address string
---@param method string
---@param ... any
---@return any ...
function component.invoke(address, method, ...) end

---Returns a table with all components attached to the computer, with the address as key and the component type as value.\
---The result also works as an iterator: `for address, componentType in component.list() do ... end`.
---@param filter? string Only list components whose type contains this string (not a pattern): `"red"` matches `"redstone"`.
---@param exact? boolean If `true`, the type must be equal to `filter`.
---@return ComponentList
function component.list(filter, exact) end

---Returns a table with the names of all methods provided by the component with the specified address.\
---The names are the keys; the values tell whether the method is called directly.
---@param address string
---@return table<string, boolean> methods
---@return string? reason
function component.methods(address) end

---Returns a table with the fields (properties with a getter and/or setter) of the component with the specified address.
---@param address string
---@return table<string, {getter: boolean, setter: boolean, direct: boolean}> fields
---@return string? reason
function component.fields(address) end

---Gets a proxy object for a component that provides all its methods as fields, so they can be called directly instead of via `component.invoke`.\
---This is what `component.gpu` and the other primaries are made of. Proxies always have the fields `address`, `type` and `slot`.\
---Example: `component.proxy(component.list("redstone")()).getInput(sides.north)`.\
---Annotate the variable with the component's class to get completions:
---```lua
------@type ComponentRedstone
---local rs = component.proxy(address)
---```
---@param address string
---@return table proxy
---@return string? reason
function component.proxy(address) end

---Gets the component type of the component with the specified address.
---@param address string
---@return string|nil componentType
---@return string? reason
function component.type(address) end

---Returns the slot the component with the specified address is installed in, or `-1` if that doesn't apply.
---@param address string
---@return integer|nil slot
---@return string? reason
function component.slot(address) end

---Tries to resolve an abbreviated address to a full address. Returns the full address on success, or `nil` and an error message otherwise.\
---Optionally filters by component type.
---@param address string
---@param componentType? string
---@return string|nil address
---@return string? reason
function component.get(address, componentType) end

---Checks whether there is a primary component of the specified type.
---@param componentType string
---@return boolean available
function component.isAvailable(componentType) end

---Checks whether the component with the specified address is the primary component of its type.
---@param address string
---@return boolean primary
function component.isPrimary(address) end

---Gets the proxy of the primary component of the specified type. Throws an error if there is none.\
---`component.getPrimary("gpu")` is the same as `component.gpu`.
---@param componentType string
---@return table proxy
function component.getPrimary(componentType) end

---Sets a new primary component for the specified type. The address may be abbreviated, but must be valid if it isn't `nil`; `nil` removes the primary.\
---Triggers the `component_unavailable` and `component_available` signals.
---@param componentType string
---@param address? string
function component.setPrimary(componentType, address) end

return component
