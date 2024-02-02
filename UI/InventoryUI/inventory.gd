extends Resource # this is to control value of slot

class_name Inv
signal update
@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty(): #not empty
		itemslots[0].amount += 1
		print(item.name + " is added to slot") #if item1 first, then if item2 first
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
			print(item.name + " is creating new slot")
	update.emit()

func destroy(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0].amount -= 1 # this operation is referring to item1.tres only
		print(item.name + " is -1")
	update.emit()

func reset_slot():
	for slot in slots:
		slot.item = null
		slot.amount = 0
	update.emit()
