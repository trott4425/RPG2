tool
extends Node

export(bool) var reset = false setget onReset
export(int) var tileSize = 16
export(int) var w = 9
export(int) var h = 4
export(int) var hoffset = 0
export(int) var woffset = 0
export(String) var tileNamePrefix = "Ground A"
#config
#var tileSize = 16
var spritesheet = preload("res://dungeon.tex")

func _ready():
    pass

func onReset(isTriggered):
    if(w == 0 || h == 0):
        w = spritesheet.get_width() / tileSize
        h = spritesheet.get_height() / tileSize

    if (isTriggered):
        reset = false

        for y in range(h):
            for x in range(w):
                var tile = Sprite.new()
                add_child(tile)
                tile.set_owner(self)
                tile.set_name(tileNamePrefix + str( x+y*w))
                tile.set_texture(spritesheet)
                tile.set_region(true)
                tile.set_region_rect(Rect2((woffset*tileSize) + x*tileSize, (hoffset*tileSize) + y*tileSize, tileSize, tileSize))
                tile.set_pos(Vector2((woffset*tileSize) + (x*tileSize+tileSize/2), (hoffset*tileSize) + (y*tileSize+tileSize/2)))