# oc-api — подсказки для OpenComputers в VS Code

Здесь лежат описания API OpenComputers 1.8.3 и OpenOS 1.8.3 для расширения **Lua** (LuaLS).
Они нужны только редактору: автодополнение, описание функций при наведении, подсветка ошибок.
**В игру эту папку копировать не нужно.** Подключена она через файл `.luarc.json` в корне проекта.

## Как пользоваться

- Подключай библиотеки так же, как в игре: `local component = require("component")`,
  `local event = require("event")` и т. д. После точки появится список функций.
- `component.gpu`, `component.robot`, `component.navigation` и другие компоненты уже знают свой тип.
- Для `component.proxy(адрес)` редактор тип не знает. Укажи его строкой выше:
  ```lua
  ---@type ComponentGPU
  local gpu = component.proxy(address)
  ```
  Класс называется `Component` + имя компонента: `ComponentRedstone`, `ComponentInventoryController`…
- В OpenOS нет глобальных `component`, `computer` и `unicode`: если забыл `require`, редактор это подчеркнёт.

## Что описано

- Все библиотеки OpenOS (`component`, `computer`, `event`, `term`, `filesystem`, `robot`, `sides`, `colors`, `keyboard`, `serialization`, `internet`, `thread`, `unicode`…).
- Все компоненты OpenComputers 1.8.3, включая блоки через адаптер (печь, маяк, нотный блок…).
- Компоненты модов из сборки: OpenSecurity, Energy Control, IndustrialCraft 2 (реактор, хранилища энергии, массфабрикатор), Railcraft (Worldspike).

## Настройки в `.luarc.json`

- `runtime.builtin` — стандартные функции Lua заменены описаниями из `globals.d.lua`, потому что в OC их набор урезан
  (например, нет `collectgarbage`, а от `debug` остались 4 функции).
- `type.weakNilCheck` — не ругаться, когда значение «может быть nil» передаётся в функцию.
  Предупреждение при обращении к полю такого значения (`file:write` после `io.open`) остаётся.

## Версия Lua

Стоит Lua 5.3, как у процессора по умолчанию (`defaultLua53=true` в `config/opencomputers/settings.conf`).
Если переключишь процессор на Lua 5.2 (Shift+ПКМ процессором в руке), замени в `.luarc.json`
`"Lua 5.3"` на `"Lua 5.2"`.

## Откуда описания

Собраны из двух открытых пакетов и сверены с исходниками OpenComputers 1.8.3, OpenOS 1.8.3
и документацией [ocdoc.cil.li](https://ocdoc.cil.li/):

- [AR2000AR/opencomputers-openos-definitions](https://github.com/AR2000AR/opencomputers-openos-definitions) — MPL-2.0, см. `LICENSE-AR2000AR-MPL2.txt`
- [FatalMerlin/OCLuaTypes](https://github.com/FatalMerlin/OCLuaTypes) — BSD-3-Clause, см. `LICENSE-FatalMerlin-BSD3.txt`
