state("Cat Quest")
{
	/*
		Autosplitter for the game Cat Quest.
		Category: Any% (Old Patch)
		Written by: Lighten95.
		Twitch: https://www.twitch.tv/lighten95
		Discord: https://discord.gg/s9Fvjde
		Github: https://github.com/LWLeijten/Cat-Quest-Autosplitter
	*/

	// Static address for current scene
	uint scene : 0xFFB710;

	// Pointer for MainQuestIndex
	uint mainQuest : 0x1046078, 0x20, 0xAC, 0x6D8, 0xC, 0x4C;

	// Pointer for SideQuestIndex
	uint sideQuest : 0x1046070, 0x20, 0x94, 0x618, 0xC, 0x50 ;
}

startup
{
	// Making the splits optional using the settings menu.
	settings.Add("firedrag", true, "Fire Dragon Quest");
	settings.Add("waterwalk", true, "Water Walking Quest");
	settings.Add("waterdrag", true, "Water Dragon Quest");
	settings.Add("arcanadrag", true, "Arcana Dragon Quest");
	settings.Add("grandpaw", true, "Grandpaw Quest");
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
	bool fireDragon = settings["firedrag"] && old.mainQuest == 16 && current.mainQuest == 30;
	bool waterWalking = settings["waterwalk"] && old.sideQuest == 36 && current.sideQuest == 38;
	bool waterDragon = settings["waterdrag"] && old.mainQuest == 6 && current.mainQuest == 17;
	bool arcanaDragon = settings["arcanadrag"] && old.mainQuest == 7 && current.mainQuest == 17;
	bool grandpaw = settings["grandpaw"] && old.mainQuest == 49 && current.mainQuest == 38;
	bool done = (old.mainQuest == 72 && current.mainQuest == 19);

	return (fireDragon || waterWalking || waterDragon || arcanaDragon || grandpaw || done);
}