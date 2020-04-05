#ifndef EXTERNS_H
#define EXTERNS_H
//A header to include all of the externs that 
//will be needed for external banks

extern void  _movement_funcs[];

extern void _move_explosion(struct Entity *e);

extern void gameISR(void);

extern void SetIM2(void);

extern void borderTest (void);

extern void setrambank0 (void);

extern void DrawGameMap (void);

//extern void unpackMap (void);

extern void unpackLevelPointer (void);

extern void setAddress (void);



//extern void __FASTCALL__ interuptSetup(void);
extern void __FASTCALL__ interuptSetup(void);

extern void __FASTCALL__ SetIM2(void);

extern void __FASTCALL__ InitSprCacheList(void);

extern void __FASTCALL__ copytoAltScreen(void);

extern void __FASTCALL__ INICIO(void);

extern void __FASTCALL__ STOP_PLAYER(void);

//extern void __CALLEE__ display_loop(void);


////////////////////////////////////

extern void __FASTCALL__ _depack(void);

extern void __FASTCALL__ bank(unsigned char ramBank);


//extern struct Entity active_enemies[MAX_ENEMIES];
//extern struct Entity my_active_shoots[MAX_ENEMIES];
//extern struct Entity enemy_active_shoots[MAX_ENEMIES];
//extern struct Entity *current_e;	// Useful for functions needing a global variable...
//extern struct Enemy enemy_locations[128]; // up to 128 enemies per level, 8 bytes per enemy: 1K

//extern unsigned char new_enemy;

#endif
