#include <amxmodx>
#include <engine>
#include <fakemeta>
#include <engine>

#define MODEL "models/mapmodels/null.mdl"

public plugin_precache()
{
	precache_model(MODEL)
}

public plugin_init()
{
	register_plugin("dod_railroad2_b2 block roof access", "3.0", "Fysiks")

	// Block Access to Top of Train Tunnel (Allies Side)
	create_wall(Float:{239.0, 1450.0, -215.0}, Float:{-16.0, -42.0, -58.0}, Float:{17.0, 50.0, 65.0})
	
	// Block Access to Top of Train Tunnel (Allies Spawn)
	create_wall(Float:{239.0, -1013.0, -215.0}, Float:{-16.0, -42.0, -58.0}, Float:{17.0, 50.0, 65.0})

	// Block Access to Top of Other Train Tunnel in Allies Spawn
	create_wall(Float:{1179.0, -1671.0, -143.0}, Float:{-40.0, -200.0, -20.0}, Float:{161.0, 150.0, 65.0})
}

stock create_wall(Float:fvOrigin[3], Float:mins[3], Float:maxs[3])
{
	// Doesn't seem to work so far.
	new entMyWall = create_entity("func_wall")
	entity_set_string(entMyWall, EV_SZ_classname, "wall")
	entity_set_model(entMyWall, MODEL)

	// Set size and absmin+absmax values
	entity_set_vector(entMyWall, EV_VEC_mins, mins)
	entity_set_vector(entMyWall, EV_VEC_absmin, mins)

	entity_set_vector(entMyWall, EV_VEC_maxs, maxs)
	entity_set_vector(entMyWall, EV_VEC_absmax, maxs)

	// Set angle
	mins[0] = 0.0
	mins[1] = 0.0
	mins[2] = 0.0
	entity_set_vector(entMyWall, EV_VEC_angles, Float:{0.0,0.0,0.0})

	// Get user origin
	entity_set_origin(entMyWall, fvOrigin)

	// Set other values
	entity_set_int(entMyWall, EV_INT_solid, SOLID_BBOX)
	entity_set_int(entMyWall, EV_INT_movetype, MOVETYPE_FLY)

	return entMyWall
}
