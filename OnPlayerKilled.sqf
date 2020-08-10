params ["_deadPlayerObject"];

[OPF_supplyDrop1Action,OPF_supplyDrop2Action] apply {
	_deadPlayerObject removeAction _x;
};