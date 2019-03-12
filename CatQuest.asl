state("Cat Quest")
{
	/*
		SCENE INDEX VALUES:
		Menu = 6, Loading = 7, Intro Cutscene = 4, In game = 3

		USEFUL MAIN QUEST LINE INDEX VALUES:
		+MainQuest_003 (Fire Dragon) = 60 -> 16
		+MainQuest_004 (Post Fire Dragon) = 30
		+MainQuest_006 (Water Dragon) = 6 -> 17
		+MainQuest_007 (Post Water Dragon/Arcana Dragon) = 1 -> 7 -> 17
		+MainQuest_008 (GrandPaw) = 6 -> 49
		+MainQuest_009 (Post grandpaw)= 38
		+MainQuest_011 = 72
		+MainQuest_012(Done) = 19

		USEFUL SIDE QUEST INDEX VALUES:
		+Waterwalking = 2 -> -1
-	*/

	// Static address for current scene
	uint scene : 0xFFB710;

	// Pointer for MainQuestIndex
	uint mainQuest : 0x1046078, 0x20, 0xAC, 0x6D8, 0xC, 0x4C;

	// Pointer for SideQuestIndex
	uint sideQuest : 0x1046078, 0x20, 0xAC, 0x6D8, 0xC, 0x4C;
}

start
{
	// Check for the start of a new game
	bool started = (old.scene == 6 && current.scene == 7);
	return started;
}

split
{
	// Check for completed quests
	bool fireDragon = (old.mainQuest == 16 && current.mainQuest == 30);
	bool waterWalking = (old.sideQuest == 2 && current.sideQuest == -1);
	bool waterDragon = (old.mainQuest == 6 && current.mainQuest == 17);
	bool arcanaDragon = (old.mainQuest == 7 && current.mainQuest == 17);
	bool grandpaw = (old.mainQuest == 49 && current.mainQuest == 38);
	bool done = (old.mainQuest == 72 && current.mainQuest == 19);

	return (fireDragon || waterWalking || waterDragon || arcanaDragon || grandpaw || done);
}