/obj/item/grenade/smokebomb
	desc = "Use this to stop both you, and the enemy from seeing anything."
	name = "smoke bomb"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	arm_sound = 'sound/weapons/grenade_arm.ogg'
	det_time = 30
	item_state = "flashbang"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/smoke

/obj/item/grenade/smokebomb/New()
	..()
	src.smoke = new /datum/effect/effect/system/smoke_spread()
	src.smoke.attach(src)

/obj/item/grenade/smokebomb/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/grenade/smokebomb/detonate()
	playsound(src.loc, 'sound/effects/smoke.ogg', 50)
	src.smoke.set_up(10, 0, usr.loc)
	spawn(0)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
	sleep(80)
	qdel(src)


//These are debug items and are not used in game.
/obj/item/grenade/smokebomb/mortar
	name = "HE mortar marker"
	desc = "Throw it at the spot you want mortar fire at. MAKE SURE YOU'RE NOT THERE!"
	det_time = 50
	var/mortar_type = "frag"

/obj/item/grenade/smokebomb/mortar/detonate()
	drop_mortar(get_turf(src), mortar_type)
	qdel(src)

/obj/item/grenade/smokebomb/mortar/fire
	name = "incendiary mortar marker"
	mortar_type = "fire"

/obj/item/grenade/smokebomb/mortar/gas
	name = "chemical mortar marker"
	mortar_type = "gas"

/obj/item/grenade/smokebomb/mortar/arty
	name = "artillery marker"
	mortar_type = "arty"
	det_time = 75

//GAS GRENADES

/obj/item/grenade/smokebomb/chemical
	desc = "It is set to detonate in 5 seconds."
	name = "chemical grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	//det_time = 50
	item_state = "csmoke"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas
	var/stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas

/obj/item/grenade/smokebomb/chemical/chlorine
	name = "chlorine gas grenade"

/obj/item/grenade/smokebomb/chemical/chlorine/New()
	..()
	src.smoke = new /datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas()
	src.smoke.attach(src)

/obj/item/grenade/smokebomb/chemical/chlorine/Destroy()
	qdel(smoke)
	smoke = null
/obj/item/grenade/smokebomb
	desc = "Use this to stop both you, and the enemy from seeing anything."
	name = "smoke bomb"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	arm_sound = 'sound/weapons/grenade_arm.ogg'
	det_time = 30
	item_state = "flashbang"
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/smoke

/obj/item/grenade/smokebomb/New()
	..()
	src.smoke = new /datum/effect/effect/system/smoke_spread()
	src.smoke.attach(src)

/obj/item/grenade/smokebomb/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/grenade/smokebomb/detonate()
	playsound(src.loc, 'sound/effects/smoke.ogg', 50)
	src.smoke.set_up(10, 0, usr.loc)
	spawn(0)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
	sleep(80)
	qdel(src)


//These are debug items and are not used in game.
/obj/item/grenade/smokebomb/mortar
	name = "HE mortar marker"
	desc = "Throw it at the spot you want mortar fire at. MAKE SURE YOU'RE NOT THERE!"
	det_time = 50
	var/mortar_type = "frag"

/obj/item/grenade/smokebomb/mortar/detonate()
	drop_mortar(get_turf(src), mortar_type)
	qdel(src)

/obj/item/grenade/smokebomb/mortar/fire
	name = "incendiary mortar marker"
	mortar_type = "fire"

/obj/item/grenade/smokebomb/mortar/gas
	name = "chemical mortar marker"
	mortar_type = "gas"

/obj/item/grenade/smokebomb/mortar/arty
	name = "artillery marker"
	mortar_type = "arty"
	det_time = 75

//GAS GRENADES

/obj/item/grenade/chemical
	desc = "It is set to detonate in 5 seconds."
	name = "chemical grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "csmoke"
	det_time = 50
	item_state = "csmoke"
	slot_flags = SLOT_BELT
	//var/datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas
	//var/stype = /datum/effect/effect/system/smoke_spread/bad/chem/payload/chlorine_gas

/obj/item/grenade/chemical/chlorine
	name = "chlorine gas grenade"

/obj/item/grenade/chemical/chlorine/New()
	..()

/obj/item/grenade/chemical/chlorine/detonate()
	..()
	create_reagents(100)
	reagents.add_reagent(/datum/reagent/toxin/chlorine_gas, 100)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/payload/S = new
	S.attach(location)
	S.set_up(reagents, 15, 0, location)
	spawn(0)
		S.start()
	qdel(src)

/obj/item/grenade/chemical/chlorine/Destroy()
	//qdel(smoke)
	//smoke = null
	return ..()

/obj/item/grenade/chemical/mustard
	name = "mustard gas grenade"

/obj/item/grenade/chemical/mustard/New()
	..()

/obj/item/grenade/chemical/mustard/detonate()
	..()
	create_reagents(100)
	reagents.add_reagent(/datum/reagent/toxin/mustard_gas, 100)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/S = new
	S.attach(location)
	S.set_up(reagents, 50, 0, location)
	spawn(0)
		S.start()
	qdel(src)

/obj/item/grenade/chemical/mustard/Destroy()
	//qdel(smoke)
	//smoke = null
	return ..()

/obj/item/grenade/chemical/phosgene
	name = "phosgene gas grenade"

/obj/item/grenade/chemical/phosgene/New()
	..()

/obj/item/grenade/chemical/phosgene/detonate()
	..()
	create_reagents(100)
	reagents.add_reagent(/datum/reagent/toxin/phosgene_gas, 100)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/S = new
	S.attach(location)
	S.set_up(reagents, 50, 0, location)
	spawn(0)
		S.start()
	qdel(src)

/obj/item/grenade/chemical/phosgene/Destroy()
	//qdel(smoke)
	//smoke = null
	return ..()

/obj/item/grenade/chemical/white_phosphorus
	name = "white phosphorus gas grenade"

/obj/item/grenade/chemical/white_phosphorus/New()
	..()
	//src.smoke = new /datum/effect/effect/system/smoke_spread/bad/chem/payload/white_phosphorus_gas()
	//src.smoke.attach(src)

/obj/item/grenade/chemical/white_phosphorus/detonate()
	..()
	create_reagents(100)
	reagents.add_reagent(/datum/reagent/toxin/mustard_gas/white_phosphorus, 100)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/payload/S = new
	S.attach(location)
	S.set_up(reagents, 15, 0, location)
	spawn(0)
		S.start()
	qdel(src)

/obj/item/grenade/chemical/white_phosphorus/Destroy()
	//qdel(smoke)
	//smoke = null
	return ..()

/obj/item/grenade/chemical/xylyl_bromide
	name = "xylyl bromide gas grenade"

/obj/item/grenade/chemical/xylyl_bromide/New()
	..()
	//src.smoke = new /datum/effect/effect/system/smoke_spread/bad/chem/payload/xylyl_bromide()
	//src.smoke.attach(src)

/obj/item/grenade/chemical/xyxyl_bromide/detonate()
	..()

	create_reagents(100)
	reagents.add_reagent(/datum/reagent/toxin/xylyl_bromide, 100)
	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/payload/S = new
	S.attach(location)
	S.set_up(reagents, 15, 0, location)
	spawn(0)
		S.start()
	qdel(src)

/obj/item/grenade/chemical/xylyl_bromide/Destroy()
	//qdel(smoke)
	//smoke = null
	return ..()

