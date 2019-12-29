#ifndef VARIABLES_H
#define VARIABLES_H

// Game variables
unsigned char ship_x;
unsigned char ship_y;
char speed_x;
char speed_y;
unsigned char frames_to_shoot;		// Can we shoot now?
unsigned char frames_fire_pressed;	// Number of frames where the FIRE button is pressed: when pressed for 6 frames, we will launch the BFB (if available)
unsigned char current_weapon;		// What is our current weapon?
unsigned char current_weapon_sprite;	// Sprite for our current weapon
unsigned char current_weapon_energy;	// Energy for the current weapon
unsigned char available_superbombs;	// Number of available superbombs (kill everything on screen)
unsigned char life_counter;		// How many lifes do we have?
unsigned char credit_counter;		// Start with 3 credits!
unsigned char end_game;			// Game will be really over at this time
unsigned char current_screen;


//ATTENTION, already defined in module 'ram99'
//unsigned char map_xpos;


unsigned char respawn_xpos;		// xpos to respawn after dying



//ATTENTION, already defined in module 'ram99'
//unsigned char map_displacement;  // Displacement in tile: 0000YYXX, where XX is the displacement in pixels (0, 1==2, 2==4, 3==6), and YY is the displacement in chars (0-2).




unsigned char max_shoots; 	// Maximum number of shoots allowed with the current weapon
unsigned char mayday;		// We have been shot!

unsigned char current_level;	// level we are playing

unsigned char previous_level;	// level we were at before getting killed or moved to a new level
unsigned char level_color;	// Color for the current level
unsigned int score;		// Need we say more?
unsigned int hiscore;		// Highest score
unsigned int next_extralife;	// Score to get the next extra life
unsigned char update_score;	// We must update the score at the next frame or two
unsigned char update_superb;	// We must update the number of superbombs
unsigned char update_life;	// We must update the number of lifess
// Final enemy
unsigned char final_enemy_active;
unsigned char final_enemy_components;		// How many sprites in the enemy

//ATTENTION, already defined in module 'ram99'
//unsigned char fenemy_defeat;
// Have we beaten it?


unsigned char fenemy_activation_counter;

// Ship sprites, used for dying animation
unsigned char ship0spr;

// Temporary definition of structs. If they work as-is, we will move them to an include file
unsigned char CurLevel_XLength;		// Length in X of the current level
unsigned char CurLevel_NTiles;		// Number of tiles for the current level

unsigned int keys[]={KEY_Q,KEY_A,KEY_O,KEY_P,KEY_SPACE};


unsigned char joy;
unsigned char joystick_type;            // Which joystick are we using


//ATTENTION, already defined in module 'ram99'
//unsigned char inertia_cheat;		// are we cheating?



unsigned char border_color;		// For some silly effects


// Array of existing enemies and shoots (max 8 enemies for now)
//ATTENTION, already defined in module 'ram99'
//struct Entity active_enemies[MAX_ENEMIES];



struct Entity my_active_shoots[MAX_ENEMIES];
struct Entity enemy_active_shoots[MAX_ENEMIES];
struct Entity power_up;			// Only one powerup active at a time...

// Array of enemy locations in the game
// We use the same Entity structure, with just one difference: X now means the tile

//struct Enemy enemy_locations[128]; // up to 128 enemies per level, 8 bytes per enemy: 1K

//ATTENTION, this is a hard coded address
struct Enemy *enemy_locations = 0xF800; // up to 256 enemies per level, 8 bytes per enemy: 2K, WARNING: this is placed in RAM 4
unsigned char new_enemy;

// Loop counters and temporary variables

//unsigned char sound_selection;
//ATTENTION, already defined in module 'ram99'


unsigned char dummy_b;
unsigned int dummy_i;
unsigned char frameskip_counter;


unsigned char numbers[5];	// 5 chars is the maximum number of digits we will print

// Levels have compressed data, let's see how it goes when loading them

unsigned char *level_pointer;
unsigned int *int_pointer;
unsigned int length_tiles;
unsigned int length_map;

#endif

