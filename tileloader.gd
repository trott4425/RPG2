tool
extends Node

export(bool) var reset = false setget onReset

#config
'''var tileSize = 16
var spritesheet = preload("res://dungeon/dungeon.png")

func _ready():
    pass

func onReset(isTriggered):
    if (isTriggered):
        reset = false
        var w = 9
        var h = 4
        var hoffset = 0
        var woffset = 0

        for y in range(h):
            for x in range(w):
                var tile = Sprite.new()
                add_child(tile)
                tile.set_owner(self)
                tile.set_name(str(x+y*w))
                tile.set_texture(spritesheet)
                tile.set_region(true)
                tile.set_region_rect(Rect2(x*tileSize, y*tileSize, tileSize, tileSize))
                tile.set_pos(Vector2(x*tileSize+tileSize/2, y*tileSize+tileSize/2))'''