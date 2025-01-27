# Mapping utility

In order to mark coordinates Mapper allows the player to place a
special item frame which will call a function.

The item frame should have:
 * `{'mapper:replace-me':true}` as custom data.
 * `mapper.replace-me` as tag.
 * An item with the components:
   * `minecraft:custom_data` should have 2 compound:
     * `mapper:function`: with fields `namespace` and `function`
     * `mapper:params`: any 1 level compound

Then when the item is placed, the function given by `mapper:function`
as `$(namespace):build-functions/$(function)` will be called with
parameters `mapper:params` as well as parameters `facing` and
`backing` for the current direction of the player. The current entity
in the execution context will be the item frame.

The called function has the reponsability to remove the item with
`kill @s`.

For example with the item frame given with:

```
give @s minecraft:item_frame[custom_data={'mapper:replace-me':true},entity_data={id:'minecraft:item_frame',Tags:['mapper.replace-me'],Item:{id:'minecraft:paper',components:{'minecraft:custom_data':{'mapper:function':{'namespace':'myns','function':'myfun','mapper:params':{'foo':'bar'}}}}}]
```

When the player places it, facing North, it will call `myns:build-functions/myfun` with:
 * `foo`: `bar`
 * `facing`: `north`
 * `backing`: `south`
