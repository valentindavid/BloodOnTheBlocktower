data modify storage clock:script book set value {components:{'minecraft:written_book_content':{pages:[],author:'',title:'Script'},'minecraft:item_name':'clock.script-book'}}
data modify storage clock:script last-page.page set value 0
data modify storage clock:script last-page.roles set value 0
data modify storage clock:script pages set value [{roles: []}]
function clock:add-script-page-nr {page: 0}
