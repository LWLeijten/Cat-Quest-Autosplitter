state("Cat Quest")
{
	/*
		SCENE INDEX VALUES:"
		Menu = 6
		Loading = 7
		Intro Cutscene = 4
		In game = 3

		MAIN QUEST LINE INDEX VALUES:
		MainQuest_001_PC = 0 -> 16 -> 44
		MainQuest_002 = 74
		MainQuest_003 = 60
	*/

	// Address for scene
	uint scene : 0xFFB710;

	// Address for MainQuestIndex
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