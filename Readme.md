# ArrayTree

The goal of this gem is to add some usefull methods for array.
This is my first gem to try the gem creation and tidy up my Application

## Methods


### tree(foreign_key = :parent_id, key = :id)

    a = [{id: 1, name: "first"}, {id: 2, name: "second", parent_id: 1}]
    organized = a.tree
    # will render
    [
        {id: 1, name: 'first', leaves: [
            { id: 2, name: 'second', parent_id: 1}
        ]}
    ]

Why **leaves** instead of children ? :children is already used by ruby, didn't want to break things ^^