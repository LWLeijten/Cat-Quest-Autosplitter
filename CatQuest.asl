state("Cat Quest")
{
	/*
		Autosplitter for the game Cat Quest.
		Category: Any% (Old Patch)
		Written by: Lighten95.
		Twitch: https://www.twitch.tv/lighten95
		Discord: https://discord.gg/s9Fvjde
		Github: https://github.com/LWLeijten/Cat-Quest-Autosplitter

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
		+Waterwalking = 7 -> 38
-	*/

	// Static address for current scene
	uint scene : 0xFFB710;

	// Pointer for MainQuestIndex
	uint mainQuest : 0x1046078, 0x20, 0xAC, 0x6D8, 0xC, 0x4C;

	// Pointer for WaterWalkingQuest
	uint sideQuest : 0x1046070, 0x20, 0x94, 0x618, 0xC, 0x50 ;
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
	bool waterWalking = (old.sideQuest == 36 && current.sideQuest == 38);
	bool waterDragon = (old.mainQuest == 6 && current.mainQuest == 17);
	bool arcanaDragon = (old.mainQuest == 7 && current.mainQuest == 17);
	bool grandpaw = (old.mainQuest == 49 && current.mainQuest == 38);
	bool done = (old.mainQuest == 72 && current.mainQuest == 19);

	return (fireDragon || waterWalking || waterDragon || arcanaDragon || grandpaw || done);
}