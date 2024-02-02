extends Resource # this is to control value of slot

class_name Inv
signal update
@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item) #this will added a new type yg InvItem with same name and texture in the same slots
	if !itemslots.is_empty(): #not empty
		itemslots[0].amount += 1
		print(item.name + " is added to slot") #if item1 then item2 is added, or if item2 then item1 is added to slot
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
		print(item.name + " is -1") #item1 is -1
	update.emit()

#func destroy_item2(item2: InvItem):
#	var itemslots = slots.filter(func(slot): return slot.item == item2)
#	if !itemslots.is_empty():
#		itemslots[0].amount -= 1 # this operation is referring to item1.tres only
#		print(item2.name + " is -1") #item1 is -1
#	update.emit()

func reset_slot(): #to reset the all value in slots
	for slot in slots:
		slot.item = null
		slot.amount = 0
	update.emit()
