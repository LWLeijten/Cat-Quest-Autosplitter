state("Cat Quest")
{
	// menu = 6, loading = 7, lore cutscene = 4, in game = 3
	uint scene : 0xFFB710;

	// Addresses for quests
}

start
{
	// Split on the transition from menu to loading screen
	if(old.scene == 6 && current.scene == 7)
	{
		return true;
	}
}

split
{
	return (1 == 2);
}