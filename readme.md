
# **Minecraft FancyUI Datapack**
<em>Created by FancyPotatOS</em>

This readme was written by myself, then completely reformatted by ChatGPT... thanks, buddy.

## **About this Datapack**
The **FancyUI Datapack** is a framework for integrating custom user interfaces into container blocks in Minecraft. It allows datapack creators to define **interactive UI elements** that detect item placement in specific slots while ensuring **safe inventory management** and **custom event handling**.

This system is ideal for **custom crafting**, **interactive chests**, **trading systems**, and any other scenario where a container should dynamically respond to player input.

### **Features:**
- **Secure Backend System** – Ensures UI elements and backend data cannot be tampered with.
- **Automatic Item Validation** – Prevents invalid items from being placed in certain slots.
- **Custom Callbacks** – Runs specific functions when changes have been detected.
- **Hopper Protection** – Prevents hoppers and hopper minecarts from interacting with the UI container.
- **Performance Optimization Option** – Adjusts responsiveness vs. efficiency based on world complexity.

---

## **How to Use**

**Demo Usage:**
For a working example, check the function folder at:
*`fancyui:demo/*`*

To place a demo UI block, run:
```mcfunction
function fancyui:demo/set_block
```
The demo UI enchants any unenchanted armor with Mending II when placed inside. Don't ask why, but why not!

### **Creating a UI Block**
1. Create a marker entity with the following tags:\
   `fancyui`\
   `fancyui.container`
2. Set the marker’s `"data"` NBT based on the **Marker Definition** section below.
3. Run:
   ```mcfunction
   function fancyui:initialize_all
   ```
   This will finalize the UI setup.

---

## **Marker Definition**
All UI block data is stored in the marker's `"data"` NBT.

### **Required Fields**
- **`container`** (_string_)
  - Specifies the block for the UI.
  - Example: `"minecraft:chest"`

- **`on_break`** (_string_)
  - Function to execute when the block is broken.

- **`slots`** (_compound list_)
  - Defines which slots are relevant and their behavior.

#### **Slot Properties**
- **`Slot`** (_int_) – The target slot’s byte value.
- **`type`** (_string_) – Defines the slot's function:
  - `"background"` – Uses a special item that **cannot be removed** and **hides the slot**.
  - `"item"` – Holds a specified item (NBT-stored item data).
  - `"watch"` – Detects item placement and can **automatically reject items** or **run a callback function**.
  - `"button"` – Detects when clicked and **runs a callback function**.

- **`save_pos`** (_bool_)
  - If `true`, saves the container’s position within the item NBT:
    `_components.custom_data.fancyui.origin_`
  - This is always enabled for `"background"` type slots.

---

## **Watch Slot Behavior**
For slots with `{ type: "watch" }`, additional NBT options are available.

### **Item Criteria (`criteria`)**
- **Optional:** Defines which items are allowed.
- **Automatically rejects** any item that doesn’t match.
- Uses Minecraft's **item predicate** system, allowing complex filtering.

**Example:**
```json
{ "criteria": "*[!enchantments]" }
```
This allows **any item without enchantments**.

---

### **Callback Function (`callback`)**
- **Optional:** Executes when a valid item is placed.
- Stores extra data in `_fancyui:data callback_data_` before execution.

#### **Fields**

- `function` (_string_)
    - Function to execute when an accepted item is placed.

- `data` (_string_)
    - **Optional:** NBT data to place in storage _`fancyui:data callback_data`_ before the callback is run

```json
"callback": {
  "function": "your_namespace:your_function",
  "data": "{ custom_data: 123 }"
}
```

### **Removal Callback (`removal_callback`)**
- **Optional:** Executes when the item is removed.
- Behaves similarly to `callback`

```json
"removal_callback": {
  "function": "your_namespace:your_function",
  "data": "{ custom_data: 123 }"
}
```


---

### **Callback Notes & Best Practices**
- **Set the score _`successful_call fancyui.master`_ to 0 at the start of _ALL_ callback functions.**
  - Otherwise, an error will be thrown.
- To **manually reject** an item, call:
  ```mcfunction
  function fancyui:reject_item
  ```
  ⚠️ **Do not** call this in `removal_callback`.

#### **Item Swapping Detection**
- If an item swap occurs, _`swapped fancyui.master`_ is set to `1`.
- _Swapping items is treated as first removing an item, then placing a new one. As a result, both the `removal_callback` and `callback` functions will be called._
- _Callback order_:
  1. **First**, _`removal_callback`_ is called.
  2. **Then**, _`callback`_ is called.
- _Since item swapping triggers the `removal_callback`, your functions should handle the case where the slot is not actually empty._
- If we have successfully found the swapping player:
  - They are tagged with _`fancyui.watch.swapper`_.
  - The original, swapped item can be found in the player's slot _`player.cursor`_.

#### **Manual Slot Modification**
If you modify a watched slot programmatically:
1. Set the score:
   ```mcfunction
   scoreboard players set modified_slot fancyui.master <slot_number>
   ```
2. Call one of the following functions:
   - `fancyui:manual_placement` (for adding items)
   - `fancyui:manual_removal` (for removing items)
   - `fancyui:manual_placement` (for overwriting items)
3. Example in `fancyui:demo/removed_result`, Line 7.

---

## **Button Slot Behavior**
For slots with `{ type: "button" }`, additional NBT options are available.

### **Callback Function (`callback`)**
- **Optional:** Executes when the button is clicked.
- Stores extra data in `_fancyui:data callback_data_` before execution.
- The player that pressed the button is tagged with _`fancyui.watch.swapper`_
  - The player's slot _`player.cursor`_ contains the button item
  - Modifying this item will persist once returned to the container
#### **Fields**

- `function` (_string_)
    - Function to execute when the button is clicked.

- `data` (_string_)
    - **Optional:** NBT data to place in storage _`fancyui:data callback_data`_ before the callback is run

```json
"callback": {
  "function": "your_namespace:your_function",
  "data": "{ custom_data: 123 }"
}
```

---

## **Configuration Settings**
- **Score:** _`config.performance fancyui.master`_
  - **Default:** `0` (disabled)
  - **Set to `1`** for a potential performance boost but with reduced UI responsiveness.
  - **Implications:**
    - Only updates containers **within 10 blocks of a player**.
    - **Disables hopper protection.**
    - Useful for worlds with **many UI blocks**.
