extends Panel #to control the label and texture visiblility. the panel also child of control

@onready var item_visual: Sprite2D = $item_display
@onready var amount_text: Label = $Label

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		elif slot.amount == 0:
			amount_text.visible = false
			item_visual.visible = false
		amount_text.text = str(slot.amount)
