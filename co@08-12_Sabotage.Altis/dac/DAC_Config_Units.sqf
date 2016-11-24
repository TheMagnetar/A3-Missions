//=======================================================================================================//
// File: DAC_Config_Units.sqf                                                                            //
// Author: Silola (silola@freenet.de), TheMagnetar                                                       //
// Version 0.1                                                                                           //
// File creation: 2015/07/13                                                                             //
// Description: This document is used in order to configure the units that the script Dynamic-AI-Creator //
//             (Silola, http://www.armaholic.com/page.php?id=25550) spawns on the map. The actual        //
//             version of this document has been modified by TheMagnetar.                                //
//                                                                                                       //
//             The following configurations are available:                                               //
//                                                                                                       //
//                        Code      Configuration                                                        //
//                        0         OPFOR CSAT                                                           //
//                        1         OPFOR CSAT: Recon                                                    //
//                        2         OPFOR CSAT: Urban                                                    //
//                        3         OPFOR CSAT: Diver                                                    //
//                        4         BLUFOR NATO                                                          //
//                        5         BLUFOR NATO: Recon                                                   //
//                        6         BLUFOR NATO: Diver                                                   //
//                        7         INDEPENDENT                                                          //
//                        8         INDEPENDENT: Recon                                                   //
//                        9         INDEPENDENT: Diver                                                   //
//                        10        CIVILIANS                                                            //
//                        11        CIVILIANS: Afro                                                      //
//                        12        CIVILIANS: Asiatics                                                  //
//                        13        CIVILIANS: Europeans                                                 //
//                        14        FIA OPFOR                                                            //
//                        15        FIA BLUFOR                                                           //
//                        16        FIA INDEPENDENT                                                      //
//                        17        RHS RUSSIAN AIRBONE TROOPS (VDV) (Vozdushno-desantnye voyska)        //
//                        18        RHS RUSSIAN MOTOR RIFLE TROOPS (MSV)                                 //
//                        19        RHS UNITED STATES ARMY WOODLAND                                      //
//                        20        RHS UNITED STATES ARMY DESERT                                        //
//                        21        RHS UNITED STATES MARINE CORPS WOODLAND                              //
//                        22        RHS UNITED STATES MARINE CORPS DESERT                                //
//                        30        BWA3 Bundeswehr (Flecktarn)                                          //
//                        31        BWA3 Bundeswehr (Tropentarn)                                         //
//                        32        BWA3 Bundeswehr Fernspäher (Flecktarn)                               //
//                        33        BWA3 Bundeswehr Fernspäher (Tropentarn)                              //
//                        40        Leights Opfor Pack: Afghan Militia                                   //
//                        41        Leights Opfor Pack: Takistan Civilians                               //
//=======================================================================================================//

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;
_TempArray = [];

switch (_TypNumber) do
{
    //===================================================================================================//
    // OPFOR CSAT                                                                                        //
    //===================================================================================================//
    case 0: {
        _Unit_Pool_S = [
            "O_crew_F","O_Helipilot_F","O_soldier_SL_F",   // Crew, Helicopter Pilot and Squad Leader
            "O_soldier_TL_F",                              // Fireteam Leader
            "O_soldier_F",                                 // Rifleman
            "O_soldier_lite_F",                            // Light Rifleman
            "O_soldier_GL_F",                              // Grenadier
            "O_soldier_AR_F",                              // Automatic Rifleman
            "O_soldier_AAR_F",                             // Assistant Automatic Rifleman
            "O_soldier_LAT_F",                             // Rifleman with AT4
            "O_soldier_AT_F",                              // Anti-Tank
            "O_soldier_AAT_F",                             // Anti-Tank Assistant
            "O_soldier_AA_F",                              // Anti-Aircraft
            "O_soldier_AAA_F",                             // Anti-Aircraft Assistant
            "O_soldier_exp_F",                             // Explosives
            "O_engineer_F",                                // Engineer
            "O_soldier_repair_F",                          // Repair Specialist
            "O_soldier_M_F",                               // Designated Marksman
            "O_spotter_F",                                 // Spotter
            "O_sniper_F",                                  // Sniper
            "O_medic_F"                                    // Medic
        ];
        _Unit_Pool_V = [
            "O_Quadbike_01_F",                             // Quad
            "O_MRAP_02_F",                                 // Ifrit
            "O_MRAP_02_gmg_F",                             // Ifrit GMG
            "O_MRAP_02_hmg_F",                             // Ifrit HMG
            "O_Truck_02_covered_F",                        // Kamaz Truck (Covered)
            "O_Truck_02_Ammo_F",                           // Kamaz Truck (Ammo)
            "O_Truck_02_transport_F",                      // Kamaz Truck (Transport)
            "O_Truck_02_box_F",                            // Kamaz Truck (Repair box)
            "O_Truck_02_fuel_F",                           // Kamaz Truck (Fuel)
            "O_Truck_02_medical_F"                         // Kamaz Truck (Medical)
        ];
        _Unit_Pool_T = [
            "O_APC_Tracked_02_cannon_F",                   // BTR-K Kamysh
            "O_APC_Tracked_02_AA_F",                       // ZSU-39 Tigris
            "O_APC_Wheeled_02_rcws_F",                     // MSE-3 Marid
            "O_MBT_02_arty_F",                             // 2S9 Sochor
            "O_MBT_02_cannon_F"                            // T-100 Varsuk
        ];
        _Unit_Pool_A = [
            "O_Heli_Attack_02_F",                          // Mi-48 Kajman
            "O_Heli_Attack_02_black_F",                    // Mi-48 Kajman (Black)
            "O_Heli_Light_02_F",                           // PO-30 Orca
            "O_Heli_Light_02_unarmed_F"                    // PO-30 Orca (Unarmed)
        ];
    };

    //===================================================================================================//
    // OPFOR CSAT: Recon                                                                                 //
    //===================================================================================================//
    case 1: {
        _Unit_Pool_S = [
            "O_crew_F","O_Helipilot_F","O_recon_TL_F",     // Crew, Helicopter Pilot and Fireteam Leader
            "O_recon_F",                                   // Recon Scout
            "O_recon_M_F",                                 // Recon Marksman
            "O_recon_LAT_F",                               // Recon Scout AT
            "O_recon_medic_F",                             // Recon Paramedic
            "O_recon_exp_F",                               // Recon Demo Specialist
            "O_recon_JTAC_F"                               // Recon JTAC
        ];
        _Unit_Pool_V = [
            "O_Quadbike_01_F",                             // Quad
            "O_MRAP_02_F"                                  // Ifrit
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [
            "O_Heli_Light_02_F",                           // PO-30 Orca
            "O_Heli_Light_02_unarmed_F"                    // PO-30 Orca (Unarmed)
        ];
    };

    //===================================================================================================//
    // OPFOR CSAT: Urban                                                                                 //
    //===================================================================================================//
    case 2: {
        _Unit_Pool_S = [
            "O_crew_F","O_Helipilot_F","O_soldierU_SL_F",  // Crew, Helicopter Pilot and Squad Leader
            "O_soldierU_TL_F",                             // Fireteam Leader
            "O_soldierU_F",                                // Rifleman
            "O_soldierU_lite_F",                           // Light Rifleman
            "O_soldierU_GL_F",                             // Grenadier
            "O_soldierU_AR_F",                             // Automatic Rifleman
            "O_soldierU_AAR_F",                            // Assistant Automatic Rifleman
            "O_soldierU_LAT_F",                            // Rifleman with AT4
            "O_soldierU_AT_F",                             // Anti-Tank
            "O_soldierU_AAT_F",                            // Anti-Tank Assistant
            "O_soldierU_AA_F",                             // Anti-Aircraft
            "O_soldierU_AAA_F",                            // Anti-Aircraft Assistant
            "O_soldierU_exp_F",                            // Explosives
            "O_engineerU_F",                               // Engineer
            "O_soldierU_repair_F",                         // Repair Specialist
            "O_soldierU_M_F",                              // Designated Marksman
            "O_medicU_F"                                   // Medic
        ];
        _Unit_Pool_V = [
            "O_MRAP_02_F",                                 // Ifrit
            "O_MRAP_02_hmg_F"                              // Ifrit HMG
        ];
        _Unit_Pool_T = [
            "O_APC_Tracked_02_cannon_F",                   // BTR-K Kamysh
            "O_APC_Wheeled_02_rcws_F"                      // MSE-3 Marid
        ];
        _Unit_Pool_A = ["O_Heli_Light_02_F"];              // PO-30 Orca
    };

    //===================================================================================================//
    // OPFOR CSAT: Diver                                                                                 //
    //===================================================================================================//
    case 3: {
        _Unit_Pool_S = [
            "O_diver_F","O_Helipilot_F","O_diver_TL_F",    // Crew, Helicopter Pilot and Fireteam Leader
            "O_diver_F",                                   // Diver
            "O_diver_F",                                   // Diver
            "O_diver_exp_F"                                // Diver Explosive Specialist
        ];
        _Unit_Pool_V = [
            "O_SDV_01_F",                                  // SDV
            "O_Boat_Transport_01_F",                       // Assault Boat
            "O_Boat_Armed_01_hmg_F"                        // Speedboat HMG
        ];
        _Unit_Pool_T = [
            "O_SDV_01_F",                                  // SDV
            "O_Boat_Transport_01_F",                       // Assault Boat
            "O_Boat_Armed_01_hmg_F"                        // Speedboat HMG
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // BLUFOR NATO                                                                                       //
    //===================================================================================================//
    case 4: {
        _Unit_Pool_S = [
            "B_crew_F","B_Helipilot_F","B_soldier_SL_F",   // Crew, Helicopter Pilot and Squad Leader
            "B_soldier_TL_F",                              // Fireteam Leader
            "B_soldier_F",                                 // Rifleman
            "B_soldier_lite_F",                            // Light Rifleman
            "B_soldier_GL_F",                              // Grenadier
            "B_soldier_AR_F",                              // Automatic Rifleman
            "B_soldier_AAR_F",                             // Assistant Automatic Rifleman
            "B_soldier_LAT_F",                             // Rifleman with AT4
            "B_soldier_AT_F",                              // Anti-Tank
            "B_soldier_AAT_F",                             // Anti-Tank Assistant
            "B_soldier_AA_F",                              // Anti-Aircraft
            "B_soldier_AAA_F",                             // Anti-Aircraft Assistant
            "B_soldier_exp_F",                             // Explosives
            "B_engineer_F",                                // Engineer
            "B_soldier_repair_F",                          // Repair Specialist
            "B_soldier_M_F",                               // Designated Marksman
            "B_spotter_F",                                 // Spotter
            "B_sniper_F",                                  // Sniper
            "B_medic_F"                                    // Medic
        ];
        _Unit_Pool_V = [
            "B_Quadbike_01_F",                             // Quad
            "B_MRAP_01_F",                                 // Hunter
            "B_MRAP_01_gmg_F",                             // Hunter GMG
            "B_MRAP_01_hmg_F",                             // Hunter HMG
            "B_Truck_01_covered_F",                        // HEMTT (Covered)
            "B_Truck_01_Ammo_F",                           // HEMTT (Ammo)
            "B_Truck_01_transport_F",                      // HEMTT (transport)
            "B_Truck_01_repair_F",                         // HEMTT (Repair)
            "B_Truck_01_fuel_F",                           // HEMTT (Fuel)
            "B_Truck_01_medical_F"                         // HEMTT (Medical)
        ];
        _Unit_Pool_T = [
            "B_APC_Wheeled_01_cannon_F",                   // AMV-7 Marshall
            "B_APC_Tracked_01_AA_F",                       // IFV-6a Cheetah
            "B_APC_Tracked_01_rcws_F",                     // IFV-6c Panther
            "B_MBT_01_arty_F",                             // M4 Scorche
            "B_MBT_01_cannon_F",                           // M2A1 Slammer
            "B_MBT_01_mlrs_F",                             // M5 Sandstorm MLRS
            "B_MBT_01_TUSK_F"                              // M2A4 Slammer UP
        ];
        _Unit_Pool_A = [
            "B_Heli_Attack_01_F",                          // AH-99 Blackfoot
            "B_Heli_Transport_01_F",                       // UH-80 Ghost Hawk
            "B_Heli_Transport_01_camo_F",                  // UH-80 Ghost Hawk (Camo)
            "B_Heli_Light_01_F",                           // AH-9 Pawnee
            "B_Heli_Light_01_unarmed_F"                    // MH-9 Hummingbird
        ];
    };

    //===================================================================================================//
    // BLUFOR NATO: Recon                                                                                //
    //===================================================================================================//
    case 5: {
        _Unit_Pool_S = [
            "B_crew_F","B_Helipilot_F","B_recon_TL_F",     // Crew, Helicopter Pilot and Fireteam Leader
            "B_recon_F",                                   // Recon Scout
            "B_recon_M_F",                                 // Recon Marksman
            "B_recon_LAT_F",                               // Recon Scout AT
            "B_recon_medic_F",                             // Recon Paramedic
            "B_recon_exp_F",                               // Recon Demo Specialist
            "B_recon_JTAC_F"                               // Recon JTAC
        ];
        _Unit_Pool_V = [
            "B_Quadbike_01_F",                             // Quad
            "B_MRAP_01_F"                                  // Hunter
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [
            "B_Heli_Light_01_F",                           // AH-9 Pawnee
            "B_Heli_Light_01_unarmed_F"                    // MH-9 Hummingbird
        ];
    };

    //===================================================================================================//
    // BLUFOR NATO: Diver                                                                                //
    //===================================================================================================//
    case 6: {
        _Unit_Pool_S = [
            "B_diver_F","B_Helipilot_F","B_diver_TL_F",    // Crew, Helicopter Pilot and Fireteam Leader
            "B_diver_F",                                   // Diver
            "B_diver_F",                                   // Diver
            "B_diver_exp_F"                                // Diver Explosive Specialist
        ];
        _Unit_Pool_V = [
            "B_SDV_01_F",                                  // SDV
            "B_Boat_Transport_01_F",                       // Assault Boat
            "B_Boat_Armed_01_minigun_F"                    // Speedboat with Minigun
        ];
        _Unit_Pool_T = [
            "B_SDV_01_F",                                  // SDV
            "B_Boat_Transport_01_F",                       // Assault Boat
            "B_Boat_Armed_01_minigun_F"                    // Speedboat with Minigun
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // INDEPENDENT                                                                                       //
    //===================================================================================================//
    case 7: {
        _Unit_Pool_S = [
            "I_crew_F","I_Helipilot_F","I_soldier_SL_F",   // Crew, Helicopter Pilot and Squad Leader
            "I_soldier_TL_F",                              // Fireteam Leader
            "I_soldier_F",                                 // Rifleman
            "I_soldier_lite_F",                            // Light Rifleman
            "I_soldier_GL_F",                              // Grenadier
            "I_soldier_AR_F",                              // Automatic Rifleman
            "I_soldier_AAR_F",                             // Assistant Automatic Rifleman
            "I_soldier_LAT_F",                             // Rifleman with AT4
            "I_soldier_AT_F",                              // Anti-Tank
            "I_soldier_AAT_F",                             // Anti-Tank Assistant
            "I_soldier_AA_F",                              // Anti-Aircraft
            "I_soldier_AAA_F",                             // Anti-Aircraft Assistant
            "I_soldier_exp_F",                             // Explosives
            "I_engineer_F",                                // Engineer
            "I_soldier_repair_F",                          // Repair Specialist
            "I_soldier_M_F",                               // Designated Marksman
            "I_spotter_F",                                 // Spotter
            "I_sniper_F",                                  // Sniper
            "I_medic_F"                                    // Medic
        ];
        _Unit_Pool_V = [
            "I_Quadbike_01_F",                             // Quad
            "I_MRAP_03_F",                                 // Strider
            "I_MRAP_03_gmg_F",                             // Strider GMG
            "I_MRAP_03_hmg_F",                             // Strider HMG
            "I_Truck_02_covered_F",                        // Zamak (Covered)
            "I_Truck_02_Ammo_F",                           // Zamak (Ammo)
            "I_Truck_02_transport_F",                      // Zamak (Transport)
            "I_Truck_02_box_F",                            // Zamak (Repair)
            "I_Truck_02_fuel_F",                           // Zamak (Fuel)
            "I_Truck_02_medical_F"                         // Zamak (Medical)
        ];
        _Unit_Pool_T = [
            "I_APC_Wheeled_03_cannon_F",                   // AFV-4 Gorgon
            "I_APC_Tracked_03_cannon_F",                   // FV-720 Mora
            "I_MBT_03_cannon_F"                            // MBT-52 Kuma
        ];
        _Unit_Pool_A = [
            "I_Heli_Light_03_F",                           // WY-55 Helicat
            "I_Heli_Light_03_unarmed_F"                    // WY-55 Helicat (Unarmed)
        ];
    };

    //===================================================================================================//
    // INDEPENDENT: Recon                                                                                //
    //===================================================================================================//
    case 8: {
        _Unit_Pool_S = [
            "I_crew_F","I_Helipilot_F","I_recon_TL_F",     // Crew, Helicopter Pilot and Fireteam Leader
            "I_recon_F",                                   // Recon Scout
            "I_recon_M_F",                                 // Recon Marksman
            "I_soldier_LAT_F",                             // Recon Scout AT
            "I_recon_medic_F",                             // Recon Paramedic
            "I_recon_exp_F",                               // Recon Demo Specialist
            "I_recon_JTAC_F"                               // Recon JTAC
        ];
        _Unit_Pool_V = [
            "I_Quadbike_01_F",                             // Quad
            "I_MRAP_03_F"                                  // Hunter
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [
            "I_Heli_Light_03_F",                           // WY-55 Helicat
            "I_Heli_Light_03_unarmed_F"                    // WY-55 Helicat (Unarmed)
        ];
    };

    //===================================================================================================//
    // INDEPENDENT: Diver                                                                                //
    //===================================================================================================//
    case 9: {
        _Unit_Pool_S = [
            "I_diver_F","I_Helipilot_F","I_diver_TL_F",    // Crew, Helicopter Pilot and Fireteam Leader
            "I_diver_F",                                   // Diver
            "I_diver_F",                                   // Diver
            "I_diver_exp_F"                                // Diver Explosive Specialist
        ];
        _Unit_Pool_V = [
            "I_SDV_01_F",                                  // SDV
            "I_Boat_Transport_01_F",                       // Assault Boat
            "I_Boat_Armed_01_minigun_F"                    // Speedboat with Minigun
        ];
        _Unit_Pool_T = [
            "I_SDV_01_F",                                  // SDV
            "I_Boat_Transport_01_F",                       // Assault Boat
            "I_Boat_Armed_01_minigun_F"                    // Speedboat with Minigun
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // CIVILIANS                                                                                         //
    //===================================================================================================//
    case 10: {
        _Unit_Pool_S = [
            "C_man_w_worker_F", "C_man_pilot_F", "C_man_1",// Crew, Helicopter Pilot, Civilian Leader
            "C_man_1_1_F",                                 // Civilian
            "C_man_1_2_F",                                 // Civilian
            "C_man_1_3_F",                                 // Civilian
            "C_man_polo_1_F",                              // Civilian with polo
            "C_man_polo_2_F",                              // Civilian with polo
            "C_man_polo_3_F",                              // Civilian with polo
            "C_man_polo_4_F",                              // Civilian with polo
            "C_man_polo_5_F",                              // Civilian with polo
            "C_man_polo_6_F",                              // Civilian with polo
            "C_man_shorts_1_F",                            // Civilian with shorts
            "C_man_shorts_2_F",                            // Civilian with shorts
            "C_man_shorts_3_F",                            // Civilian with shorts
            "C_man_p_shorts_1_F",                          // Fugitive with shorts
            "C_man_p_beggar_F",                            // Beggar
            "C_man_p_fugitive_F",                          // Fugitive
            "C_man_hunter_1_F"                             // Hunter
        ];
        _Unit_Pool_V = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_T = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // CIVILIANS                                                                                         //
    //===================================================================================================//
    case 10: {
        _Unit_Pool_S = [
            "C_man_w_worker_F", "C_man_pilot_F", "C_man_1",// Crew, Helicopter Pilot, Civilian Leader
            "C_man_1_1_F",                                 // Civilian
            "C_man_1_2_F",                                 // Civilian
            "C_man_1_3_F",                                 // Civilian
            "C_man_polo_1_F",                              // Civilian with polo
            "C_man_polo_1_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_1_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_1_F_euro",                         // Civilian with polo (European)
            "C_man_polo_2_F",                              // Civilian with polo
            "C_man_polo_2_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_2_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_2_F_euro",                         // Civilian with polo (European)
            "C_man_polo_3_F",                              // Civilian with polo
            "C_man_polo_3_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_3_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_3_F_euro",                         // Civilian with polo (European)
            "C_man_polo_4_F",                              // Civilian with polo
            "C_man_polo_4_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_4_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_4_F_euro",                         // Civilian with polo (European)
            "C_man_polo_5_F",                              // Civilian with polo
            "C_man_polo_5_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_5_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_5_F_euro",                         // Civilian with polo (European)
            "C_man_polo_6_F",                              // Civilian with polo
            "C_man_polo_6_F_afro",                         // Civilian with polo (Afro)
            "C_man_polo_6_F_asia",                         // Civilian with polo (Asian)
            "C_man_polo_6_F_euro",                         // Civilian with polo (European)
            "C_man_shorts_1_F",                            // Civilian with shorts
            "C_man_shorts_1_F_afro",                       // Civilian with shorts (Afro)
            "C_man_shorts_1_F_asia",                       // Civilian with shorts (Asian)
            "C_man_shorts_1_F_euro",                       // Civilian with shorts (European)
            "C_man_shorts_2_F",                            // Civilian with shorts
            "C_man_shorts_2_F_afro",                       // Civilian with shorts (Afro)
            "C_man_shorts_2_F_asia",                       // Civilian with shorts (Asian)
            "C_man_shorts_2_F_euro",                       // Civilian with shorts (European)
            "C_man_shorts_3_F",                            // Civilian with shorts
            "C_man_shorts_3_F_afro",                       // Civilian with shorts (Afro)
            "C_man_shorts_3_F_asia",                       // Civilian with shorts (Asian)
            "C_man_shorts_3_F_euro",                       // Civilian with shorts (European)
            "C_man_p_shorts_1_F",                          // Fugitive with shorts
            "C_man_p_shorts_1_F_afro",                     // Fugitive with shorts (Afro)
            "C_man_p_shorts_1_F_asia",                     // Fugitive with shorts (Asian)
            "C_man_p_shorts_1_F_euro",                     // Fugitive with shorts (European)
            "C_man_p_beggar_F",                            // Beggar
            "C_man_p_beggar_F_afro",                       // Beggar (Afro)
            "C_man_p_beggar_F_asia",                       // Beggar (Asian)
            "C_man_p_beggar_F_euro",                       // Beggar (European)
            "C_man_p_fugitive_F",                          // Fugitive
            "C_man_p_fugitive_F_afro",                     // Fugitive (Afro)
            "C_man_p_fugitive_F_asia",                     // Fugitive (Asian)
            "C_man_p_fugitive_F_euro",                     // Fugitive (European)
            "C_man_hunter_1_F"                             // Hunter
        ];
        _Unit_Pool_V = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_T = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_A = [
            "C_Heli_Light_01_civil_F",                     // M900
            "C_Heli_Light_01_blue_F"                       // M900 (Blue)
        ];
    };

    //===================================================================================================//
    // CIVILIANS: AFRO                                                                                   //
    //===================================================================================================//
    case 11: {
        _Unit_Pool_S = [
            "C_man_w_worker_F", "C_man_pilot_F", "C_man_1",// Crew, Helicopter Pilot, Civilian Leader
            "C_man_polo_1_F_afro",                         // Civilian with polo
            "C_man_polo_2_F_afro",                         // Civilian with polo
            "C_man_polo_3_F_afro",                         // Civilian with polo
            "C_man_polo_4_F_afro",                         // Civilian with polo
            "C_man_polo_5_F_afro",                         // Civilian with polo
            "C_man_polo_6_F_afro",                         // Civilian with polo
            "C_man_shorts_1_F_afro",                       // Civilian with shorts
            "C_man_shorts_2_F_afro",                       // Civilian with shorts
            "C_man_shorts_3_F_afro",                       // Civilian with shorts
            "C_man_p_shorts_1_F_afro",                     // Fugitive with shorts
            "C_man_p_beggar_F_afro",                       // Beggar
            "C_man_p_fugitive_F_afro"                      // Fugitive
        ];
        _Unit_Pool_V = [
            "C_Van_01_box_F",                              // Vanwith caixa
            "C_Van_01_transport_F",                        // Vande transport
            "C_Van_01_fuel_F",                             // Vanwith combustible
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW esportiu
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_T = [
            "C_Van_01_box_F",                              // Vanwith caixa
            "C_Van_01_transport_F",                        // Vande transport
            "C_Van_01_fuel_F",                             // Vanwith combustible
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW esportiu
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_A = [
            "C_Heli_Light_01_civil_F",                     // M900
            "C_Heli_Light_01_blue_F"                       // M900 (Blue)
        ];
    };

    //===================================================================================================//
    // CIVILIANS: Asian                                                                                  //
    //===================================================================================================//
    case 12: {
        _Unit_Pool_S = [
            "C_man_w_worker_F", "C_man_pilot_F", "C_man_1",// Crew, Helicopter Pilot, Civilian Leader
            "C_man_polo_1_F_asia",                         // Civilian with polo
            "C_man_polo_2_F_asia",                         // Civilian with polo
            "C_man_polo_3_F_asia",                         // Civilian with polo
            "C_man_polo_4_F_asia",                         // Civilian with polo
            "C_man_polo_5_F_asia",                         // Civilian with polo
            "C_man_polo_6_F_asia",                         // Civilian with polo
            "C_man_shorts_1_F_asia",                       // Civilian with shorts
            "C_man_shorts_2_F_asia",                       // Civilian with shorts
            "C_man_shorts_3_F_asia",                       // Civilian with shorts
            "C_man_p_shorts_1_F_asia",                     // Fugitive with shorts
            "C_man_p_beggar_F_asia",                       // Beggar
            "C_man_p_fugitive_F_asia"                      // Fugitive
        ];
        _Unit_Pool_V = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_T = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_A = [
            "C_Heli_Light_01_civil_F",                     // M900
            "C_Heli_Light_01_blue_F"                       // M900 (Blue)
        ];
    };

    //===================================================================================================//
    // CIVILIANS: European                                                                               //
    //===================================================================================================//
    case 13: {
        _Unit_Pool_S = [
            "C_man_w_worker_F", "C_man_pilot_F", "C_man_1",// Crew, Helicopter Pilot, Civilian Leader
            "C_man_1_1_F",                                 // Civil
            "C_man_1_2_F",                                 // Civil
            "C_man_1_3_F",                                 // Civil
            "C_man_polo_1_F_euro",                         // Civilian with polo
            "C_man_polo_2_F_euro",                         // Civilian with polo
            "C_man_polo_3_F_euro",                         // Civilian with polo
            "C_man_polo_4_F_euro",                         // Civilian with polo
            "C_man_polo_5_F_euro",                         // Civilian with polo
            "C_man_polo_6_F_euro",                         // Civilian with polo
            "C_man_shorts_1_F_euro",                       // Civilian with shorts
            "C_man_shorts_2_F_euro",                       // Civilian with shorts
            "C_man_shorts_3_F_euro",                       // Civilian with shorts
            "C_man_p_shorts_1_F_euro",                     // Fugitive with shorts
            "C_man_p_beggar_F_euro",                       // Beggar
            "C_man_p_fugitive_F_euro",                     // Fugitive
            "C_man_hunter_1_F"                             // Hunter
        ];
        _Unit_Pool_V = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_T = [
            "C_Van_01_box_F",                              // Van (Box)
            "C_Van_01_transport_F",                        // Van (Transport)
            "C_Van_01_fuel_F",                             // Van (Fuel)
            "C_Hatchback_01_F",                            // VW
            "C_Hatchback_01_sport_F",                      // VW (Sport)
            "C_Quadbike_01_F",                             // Quad
            "C_Offroad_01_F",                              // Offroad
            "C_SUV_01_F"                                   // VW
        ];
        _Unit_Pool_A = [
            "C_Heli_Light_01_civil_F",                     // M900
            "C_Heli_Light_01_blue_F"                       // M900 (Blue)
        ];
    };

    //===================================================================================================//
    // FIA OPFOR                                                                                         //
    //===================================================================================================//
    case 14: {
        _Unit_Pool_S = [
            "O_G_soldier_F","O_G_soldier_F","O_G_soldier_SL_F",  // Crew, Helicopter Pilot and Squad Leader
            "O_G_soldier_TL_F",                                  // Fireteam Leader
            "O_G_soldier_F",                                     // Rifleman
            "O_G_soldier_lite_F",                                // Light Rifleman
            "O_G_soldier_GL_F",                                  // Grenadier
            "O_G_soldier_AR_F",                                  // Automatic Rifleman
            "O_G_soldier_A_F",                                   // Ammo Bearer
            "O_G_soldier_LAT_F",                                 // Rifleman with AT4
            "O_G_soldier_exp_F",                                 // Explosives
            "O_G_engineer_F",                                    // Engineer
            "O_G_soldier_M_F",                                   // Designated Marksman
            "O_G_medic_F"                                        // Medic
        ];
        _Unit_Pool_V = [
            "O_G_Quadbike_01_F",                                 // Quad
            "O_G_Offroad_01_F",                                  // Offroad
            "O_G_Offroad_01_armed_F",                            // Offroad HMG
            "B_G_Offroad_01_repair_F"                            // Offroad (Repair)
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // FIA BLUFOR                                                                                        //
    //===================================================================================================//
    case 15: {
        _Unit_Pool_S = [
            "B_G_soldier_F","B_G_soldier_F","B_G_soldier_SL_F",  // Crew, Helicopter Pilot and Squad Leader
            "B_G_soldier_TL_F",                                  // Fireteam Leader
            "B_G_soldier_F",                                     // Rifleman
            "B_G_soldier_lite_F",                                // Light Rifleman
            "B_G_soldier_GL_F",                                  // Grenadier
            "B_G_soldier_AR_F",                                  // Automatic Rifleman
            "B_G_soldier_A_F",                                   // Ammo Bearer
            "B_G_soldier_LAT_F",                                 // Rifleman with AT4
            "B_G_soldier_exp_F",                                 // Explosives
            "B_G_engineer_F",                                    // Engineer
            "B_G_soldier_M_F",                                   // Designated Marksman
            "B_G_medic_F"                                        // Medic
        ];
        _Unit_Pool_V = [
            "B_G_Quadbike_01_F",                                 // Quad
            "B_G_Offroad_01_F",                                  // Offroad
            "B_G_Offroad_01_armed_F",                            // Offroad HMG
            "B_G_Offroad_01_repair_F"                            // Offroad (Repair)
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // FIA INDEPENDENT                                                                                   //
    //===================================================================================================//
    case 16: {
        _Unit_Pool_S = [
            "I_G_soldier_F","I_G_soldier_F","I_G_soldier_SL_F",  // Crew, Helicopter Pilot and Squad Leader
            "I_G_soldier_TL_F",                                  // Fireteam Leader
            "I_G_soldier_F",                                     // Rifleman
            "I_G_soldier_lite_F",                                // Light Rifleman
            "I_G_soldier_GL_F",                                  // Grenadier
            "I_G_soldier_AR_F",                                  // Automatic Rifleman
            "I_G_soldier_A_F",                                   // Ammo Bearer
            "I_G_soldier_LAT_F",                                 // Rifleman with AT4
            "I_G_soldier_exp_F",                                 // Explosives
            "I_G_engineer_F",                                    // Engineer
            "I_G_soldier_M_F",                                   // Designated Marksman
            "I_G_medic_F"                                        // Medic
        ];
        _Unit_Pool_V = [
            "I_G_Quadbike_01_F",                                 // Quad
            "I_G_Offroad_01_F",                                  // Offroad
            "I_G_Offroad_01_armed_F",                            // Offroad HMG
            "I_G_Offroad_01_repair_F"                            // Offroad (Repair)
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // RHS RUSSIAN AIRBONE TROOPS (VDV) (Vozdushno-desantnye voyska)                                     //
    //===================================================================================================//
    case 17: {
        _Unit_Pool_S = [
            "rhs_vdv_combatcrew","rhs_pilot","rhs_vdv_sergeant",   // Crew, Helicopter Pilot and Squad Leader
            "rhs_vdv_junior_sergeant",                     // Fireteam Leader
            "rhs_vdv_rifleman",                            // Rifleman
            "rhs_vdv_grenadier",                           // Grenadier
            "rhs_vdv_grenadier_rpg",                       // Grenadier RPG
            "rhs_vdv_strelok_rpg_assist",
            "rhs_vdv_machinegunner",                       // Machinegunner
            "rhs_vdv_machinegunner_assistant",             // Assistant Machinegunner
            "rhs_vdv_LAT",                                 // Rifleman with AT4
            "rhs_vdv_at",                                  // Anti-Tank
            "rhs_vdv_aa",                                  // Anti-Aircraft
            "rhs_vdv_rshg2",                               // Explosives
            "rhs_vdv_engineer",                            // Engineer
            "rhs_vdv_efreitor",
            "rhs_vdv_marksman",                            // Designated Marksman
            "rhs_vdv_medic"                                // Medic
        ];
        _Unit_Pool_V = [
            "rhs_tigr_ffv_vdv",
            "rhs_uaz_vdv",
            "RHS_Ural_Open_VDV_01"
        ];
        _Unit_Pool_T = [
            "rhs_sprut_vdv",                               // Tank
            "rhs_bmd1p",
            "rhs_bmd2m",
            "rhs_bmd4m_vdv",
            "rhs_bmd4ma_vdv",
            "rhs_bmp1p_vdv",
            "rhs_bmp2k_vdv",
            "rhs_btr80_vdv",
            "rhs_btr80a_vdv"
        ];
        _Unit_Pool_A = [
            "RHS_Mi8MTV3_vdv",
            "RHS_Mi8MTV3_vdv",
            "RHS_Mi8MTV3_UPK23_vdv",
            "RHS_Mi24V_UPK23_vdv"
        ];
    };

    //===================================================================================================//
    // RHS RUSSIAN MOTOR RIFLE TROOPS (MSV)                                                              //
    //===================================================================================================//
    case 18: {
        _Unit_Pool_S = [
            "rhs_msv_combatcrew","rhs_pilot","rhs_msv_sergeant",   // Crew, Helicopter Pilot and Squad Leader
            "rhs_msv_junior_sergeant",                     // Fireteam Leader
            "rhs_msv_rifleman",                            // Rifleman
            "rhs_msv_grenadier",                           // Grenadier
            "rhs_msv_grenadier_rpg",                       // Grenadier RPG
            "rhs_msv_strelok_rpg_assist",
            "rhs_msv_machinegunner",                       // Machinegunner
            "rhs_msv_machinegunner_assistant",             // Assistant Machinegunner
            "rhs_msv_LAT",                                 // Rifleman with AT4
            "rhs_msv_at",                                  // Anti-Tank
            "rhs_msv_aa",                                  // Anti-Aircraft
            "rhs_msv_rshg2",                               // Explosives
            "rhs_msv_engineer",                            // Engineer
            "rhs_msv_efreitor",
            "rhs_msv_marksman",                            // Designated Marksman
            "rhs_msv_medic"                                // Medic
        ];
        _Unit_Pool_V = [
            "rhs_tigr_msv",
            "RHS_UAZ_MSV_01",
            "rhs_uaz_open_MSV_01",
            "RHS_BM21_MSV_01",
            "rhs_gaz66_msv",
            "rhs_gaz66o_msv",
            "rhs_gaz66_r142_msv",
            "rhs_gaz66_ap2_msv",
            "RHS_Ural_MSV_01",
            "rhs_gaz66_repair_msv",
            "RHS_Ural_Fuel_MSV_01"
        ];
        _Unit_Pool_T = [
            "rhs_btr60_msv",
            "rhs_btr70_msv",
            "rhs_btr80_msv",
            "rhs_btr80a_msv",
            "rhs_bmp1_msv",
            "rhs_bmp1d_msv",
            "rhs_bmp1k_msv",
            "rhs_bmp1p_msv",
            "rhs_brm1k_msv",
            "rhs_bmp2_msv",
            "rhs_bmp2e_msv",
            "rhs_bmp2d_msv",
            "rhs_bmp2k_msv",
            "rhs_prp3_msv"
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // RHS UNITED STATES ARMY WOODLAND                                                                   //
    //===================================================================================================//
    case 19: {
        _Unit_Pool_S = [
            "rhsusf_army_ocp_combatcrewman","rhsusf_army_ocp_helipilot","rhsusf_army_ocp_squadleader",   // Crew, Helicopter Pilot and Squad Leader
            "rhsusf_army_ocp_teamleader",                  // Fireteam Leader
            "rhsusf_army_ocp_rifleman",                    // Rifleman
            "rhsusf_army_ocp_riflemanl",                   // Light Rifleman
            "rhsusf_army_ocp_grenadier",                   // Grenadier
            "rhsusf_army_ocp_autorifleman",                // Automatic Rifleman
            "rhsusf_army_ocp_autoriflemana",               // Assistant Automatic Rifleman
            "rhsusf_army_ocp_riflemanat",                  // Rifleman AT (M136)
            "rhsusf_army_ocp_javelin",                     // Anti-Tank (Javelin)
            "rhsusf_army_ocp_aa",                          // Anti-Aircraft (Stinger)
            "rhsusf_army_ocp_explosives",                  // Explosives
            "rhsusf_army_ocp_engineer",                    // Engineer
            "rhsusf_army_ocp_machinegunner",               // Machinegunner
            "rhsusf_army_ocp_machinegunnera",              // Assistant Machinegunner
            "rhsusf_army_ocp_marksman",                    // Designated Marksman
            "rhsusf_army_ocp_sniper",                      // Sniper
            "rhsusf_army_ocp_medic"                        // Medic
        ];
        _Unit_Pool_V = [
            "rhsusf_m1025_w",                              // HMMWV (Unarmed)
            "rhsusf_m1025_w_mk19",                         // HMMWV (MK19)
            "rhsusf_m1025_w_m2",                           // HMMWV (M2)
            "rhsusf_m998_w_2dr",
            "rhsusf_m998_w_2dr_fulltop",
            "rhsusf_m998_w_2dr_halftop",
            "rhsusf_m998_w_4dr",
            "rhsusf_m998_w_4dr_fulltop",
            "rhsusf_m998_w_4dr_halftop"
        ];
        _Unit_Pool_T = [
            "rhs_m113_usarmy",                             // APC M113A3
            "rhs_m2a2_wd",                                 // IPC
            "rhs_m2a2_buski_wd",                           // IPC
            "rhs_m2a3_buski_wd",                           // IPC
            "rhs_m2a3_wd",                                 // IPC
            "rhs_m6_wd",                                   // IPC
            "rhsusf_m1a1aimwd_usarmy",                     // Tank
            "rhsusf_m1a1aim_tuski_wd",                     // Tank
            "rhsusf_m1a2sep1wd_usarmy",                    // Tank
            "rhsusf_m1a2sep1tuskiwd_usarmy",               // Tank
            "rhsusf_m109_usarmy"                           // Artillery
        ];
        _Unit_Pool_A = [
            "RHS_AH64D_wd",                                // Boeing AH-64 Apache Longbow (Multi-Role)
            "RHS_AH64D_wd_GS",                             // Boeing AH-64 Apache Longbow (Ground-Supresion)
            "RHS_AH64D_wd_CS",                             // Boeing AH-64 Apache Longbow (Close-Support)
            "RHS_AH64D_wd_AA",                             // Boeing AH-64 Apache Longbow (AA)
            "RHS_UH60M",                                   // Sikorsky UH-60 Black Hawk
            "RHS_UH60M_MEV2",                              // Sikorsky UH-60 Black Hawk MEV
            "RHS_UH60M_MEV"                                // Sikorsky UH-60 Black Hawk MEV (ESSS)
        ];
    };

    //===================================================================================================//
    // RHS UNITED STATES ARMY DESERT                                                                   //
    //===================================================================================================//
    case 20: {
        _Unit_Pool_S = [
            "rhsusf_army_ucp_combatcrewman","rhsusf_army_ucp_helipilot","rhsusf_army_ucp_squadleader",   // Crew, Helicopter Pilot and Squad Leader
            "rhsusf_army_ucp_teamleader",                  // Fireteam Leader
            "rhsusf_army_ucp_rifleman",                    // Rifleman
            "rhsusf_army_ucp_riflemanl",                   // Light Rifleman
            "rhsusf_army_ucp_grenadier",                   // Grenadier
            "rhsusf_army_ucp_autorifleman",                // Automatic Rifleman
            "rhsusf_army_ucp_autoriflemana",               // Assistant Automatic Rifleman
            "rhsusf_army_ucp_riflemanat",                  // Rifleman AT (M136)
            "rhsusf_army_ucp_javelin",                     // Anti-Tank (Javelin)
            "rhsusf_army_ucp_aa",                          // Anti-Aircraft (Stinger)
            "rhsusf_army_ucp_explosives",                  // Explosives
            "rhsusf_army_ucp_engineer",                    // Engineer
            "rhsusf_army_ucp_machinegunner",               // Machinegunner
            "rhsusf_army_ucp_machinegunnera",              // Assistant Machinegunner
            "rhsusf_army_ucp_marksman",                    // Designated Marksman
            "rhsusf_army_ucp_sniper",                      // Sniper
            "rhsusf_army_ucp_medic"                        // Medic
        ];
        _Unit_Pool_V = [
            "rhsusf_m1025_d",                              // HMMWV (Unarmed)
            "rhsusf_m1025_d_Mk19",                         // HMMWV (MK19)
            "rhsusf_m1025_d_m2",                           // HMMWV (M2)
            "rhsusf_m998_d_2dr",
            "rhsusf_m998_d_2dr_fulltop",
            "rhsusf_m998_d_2dr_halftop",
            "rhsusf_m998_d_4dr",
            "rhsusf_m998_d_4dr_fulltop",
            "rhsusf_m998_d_4dr_halftop"
        ];
        _Unit_Pool_T = [
            "rhs_m113d_usarmy",                            // APC M113A3
            "rhs_m2a2",                                    // IPC
            "rhs_m2a2_buski",                              // IPC
            "rhs_m2a3_buski",                              // IPC
            "rhs_m2a3",                                    // IPC
            "rhs_m6",                                      // IPC
            "rhsusf_m1a1aimd_usarmy",                      // Tank
            "rhsusf_m1a1aim_tuski_d",                      // Tank
            "rhsusf_m1a2sep1d_usarmy",                     // Tank
            "rhsusf_m1a2sep1tuskid_usarmy",                // Tank
            "rhsusf_m109_usarmy"                           // Artillery
        ];
        _Unit_Pool_A = [
            "RHS_AH64D",                                   // Boeing AH-64 Apache Longbow (Multi-Role)
            "RHS_AH64D_GS",                                // Boeing AH-64 Apache Longbow (Ground-Supresion)
            "RHS_AH64D_CS",                                // Boeing AH-64 Apache Longbow (Close-Support)
            "RHS_AH64d_AA",                                // Boeing AH-64 Apache Longbow (AA)
            "RHS_UH60M_d",                                 // Sikorsky UH-60 Black Hawk
            "RHS_UH60M_MEV2_d",                            // Sikorsky UH-60 Black Hawk MEV
            "RHS_UH60M_MEV_d"                              // Sikorsky UH-60 Black Hawk MEV (ESSS)
        ];
    };

    //===================================================================================================//
    // RHS UNITED STATES MARINE CORPS WOODLAND                                                           //
    //===================================================================================================//
    case 21: {
        _Unit_Pool_S = [
            "rhsusf_usmc_marpat_wd_combatcrewman","rhsusf_usmc_marpat_wd_helipilot","rhsusf_usmc_marpat_wd_squadleader",   // Crew, Helicopter Pilot and Squad Leader
            "rhsusf_usmc_marpat_wd_teamleader",            // Fireteam Leader
            "rhsusf_usmc_marpat_wd_rifleman",              // Rifleman
            "rhsusf_usmc_marpat_wd_rifleman_light",        // Light Rifleman
            "rhsusf_usmc_marpat_wd_grenadier",             // Grenadier
            "rhsusf_usmc_marpat_wd_autorifleman_m249",     // Automatic Rifleman
            "rhsusf_usmc_marpat_wd_autorifleman_m249_ass", // Assistant Automatic Rifleman
            "rhsusf_usmc_marpat_wd_riflemanat",            // Rifleman AT (M136)
            "rhsusf_usmc_marpat_wd_javelin",               // Anti-Tank (Javelin)
            "rhsusf_usmc_marpat_wd_stinger",               // Anti-Aircraft (Stinger)
            "rhsusf_usmc_marpat_wd_explosives",            // Explosives
            "rhsusf_usmc_marpat_wd_engineer",              // Engineer
            "rhsusf_usmc_marpat_wd_machinegunner",         // Machinegunner
            "rhsusf_usmc_marpat_wd_machinegunner_ass",     // Assistant Machinegunner
            "rhsusf_usmc_marpat_wd_marksman",              // Designated Marksman
            "rhsusf_usmc_marpat_wd_sniper",                // Sniper
            "rhsusf_usmc_marpat_wd_spotter",               // Spotter
            "rhsusf_navy_marpat_wd_medic"                  // Medic
        ];
        _Unit_Pool_V = [
            "rhsusf_m1025_w_s",                            // HMMWV (Unarmed)
            "rhsusf_m1025_w_s_Mk19",                       // HMMWV (MK19)
            "rhsusf_m1025_w_s_m2",                         // HMMWV (M2)
            "rhsusf_m998_w_s_2dr",
            "rhsusf_m998_w_s_2dr_fulltop",
            "rhsusf_m998_w_s_2dr_halftop",
            "rhsusf_m998_w_s_4dr",
            "rhsusf_m998_w_s_4dr_fulltop",
            "rhsusf_m998_w_s_4dr_halftop",
            "rhsusf_rg33_usmc_wd",
            "rhsusf_rg33_m2_usmc_wd"
        ];
        _Unit_Pool_T = [
            "rhsusf_m1a1fep_wd",
            "rhsusf_m1a1fep_od"
        ];
        _Unit_Pool_A = [
            "RHS_AH1Z_wd",                                 // Bell AH-1Z Viper (Multi-Role)
            "RHS_AH1Z_wd_GS",                              // Bell AH-1Z Viper (Ground-Suppression)
            "RHS_AH1Z_wd_CS",                              // Bell AH-1Z Viper (Close-Support)
            "RHS_UH1Y_UNARMED",                            // UH1Y (Unarmed)
            "RHS_UH1Y_FFAR",                               // UH1Y FFAR
            "RHS_UH1Y"                                     // UH1Y FFAR/MG
        ];
    };

    //===================================================================================================//
    // RHS UNITED STATES MARINE CORPS DESERT                                                             //
    //===================================================================================================//
    case 22: {
        _Unit_Pool_S = [
            "rhsusf_usmc_marpat_d_combatcrewman","rhsusf_usmc_marpat_d_helipilot","rhsusf_usmc_marpat_d_squadleader",   // Crew, Helicopter Pilot and Squad Leader
            "rhsusf_usmc_marpat_d_teamleader",             // Fireteam Leader
            "rhsusf_usmc_marpat_d_rifleman",               // Rifleman
            "rhsusf_usmc_marpat_d_rifleman_light",         // Light Rifleman
            "rhsusf_usmc_marpat_d_grenadier",              // Grenadier
            "rhsusf_usmc_marpat_d_autorifleman_m249",      // Automatic Rifleman
            "rhsusf_usmc_marpat_d_autorifleman_m249_ass",  // Assistant Automatic Rifleman
            "rhsusf_usmc_marpat_d_riflemanat",             // Rifleman AT (M136)
            "rhsusf_usmc_marpat_d_javelin",                // Anti-Tank (Javelin)
            "rhsusf_usmc_marpat_d_stinger",                // Anti-Aircraft (Stinger)
            "rhsusf_usmc_marpat_d_explosives",             // Explosives
            "rhsusf_usmc_marpat_d_engineer",               // Engineer
            "rhsusf_usmc_marpat_d_machinegunner",          // Machinegunner
            "rhsusf_usmc_marpat_d_machinegunner_ass",      // Assistant Machinegunner
            "rhsusf_usmc_marpat_d_marksman",               // Designated Marksman
            "rhsusf_usmc_marpat_d_sniper",                 // Sniper
            "rhsusf_usmc_marpat_d_spotter",                // Spotter
            "rhsusf_navy_marpat_d_medic"                   // Medic
        ];
        _Unit_Pool_V = [
            "rhsusf_m1025_d_s",                            // HMMWV (Unarmed)
            "rhsusf_m1025_d_s_Mk19",                       // HMMWV (MK19)
            "rhsusf_m1025_d_s_m2",                         // HMMWV (M2)
            "rhsusf_m998_d_s_2dr",
            "rhsusf_m998_d_s_2dr_fulltop",
            "rhsusf_m998_d_s_2dr_halftop",
            "rhsusf_m998_d_s_4dr",
            "rhsusf_m998_d_s_4dr_fulltop",
            "rhsusf_m998_d_s_4dr_halftop",
            "rhsusf_rg33_usmc_d",
            "rhsusf_rg33_m2_usmc_d"
        ];
        _Unit_Pool_T = ["rhsusf_m1a1fep_d"];
        _Unit_Pool_A = [
            "RHS_AH1Z",                                    // Bell AH-1Z Viper (Multi-Role)
            "RHS_AH1Z_GS",                                 // Bell AH-1Z Viper (Ground-Suppression)
            "RHS_AH1Z_CS",                                 // Bell AH-1Z Viper (Close-Support)
            "RHS_UH1Y_UNARMED_d",                          // UH1Y (Unarmed)
            "RHS_UH1Y_FFAR_d",                             // UH1Y FFAR
            "RHS_UH1Y_d"                                   // UH1Y FFAR/MG
        ];
    };

    //===================================================================================================//
    // BW: Bundeswehr (Flecktarn)                                                                        //
    //===================================================================================================//
    case 30: {
        _Unit_Pool_S = [
            "BWA3_Crew_Fleck","BWA3_Helipilot","BWA3_SL_Fleck",  // Crew, Helicopter Pilot and Squad Leader
            "BWA3_TL_Fleck",                                     // Fireteam Leader
            "BWA3_Rifleman_Fleck",                               // Rifleman
            "BWA3_Rifleman_lite_Fleck",                          // Light Rifleman
            "BWA3_Rifleman_unarmed_Fleck",                       // Rifleman (Unarmed)
            "BWA3_RiflemanG27_Fleck",                            // Rifleman (G27)
            "BWA3_RiflemanG28_Fleck",                            // Rifleman (G28)
            "BWA3_Grenadier_Fleck",                              // Grenadier
            "BWA3_GrenadierG27_Fleck",                           // Grenadier (G27)
            "BWA3_Autorifleman_Fleck",                           // Automatic Rifleman
            "BWA3_AutoriflemanMG5_Fleck",                        // Automatic Rifleman (MG5)
            "BWA3_CombatLifeSaver_Fleck",                        // Combat Life Saver
            "BWA3_Marksman_Fleck",                               // Designated Marksman
            "BWA3_SniperG82_Fleck",                              // Sniper
            "BWA3_Spotter_Fleck",                                // Spotter
            "BWA3_RiflemanAT_RGW90_Fleck",                       // Anti-Tank (RGW90)
            "BWA3_RiflemanAT_Pzf3_Fleck",                        // Anti-Tank (Panzerfaust 3)
            "BWA3_RiflemanAA_Fliegerfaust_Fleck",                // Anti-Aircraft (Fliegerfaust)
            "BWA3_Engineer_Fleck"                                // Engineer
        ];
        _Unit_Pool_V = [];
        _Unit_Pool_T = [
            "BWA3_Puma_Fleck",                            // IFV Puma
            "BWA3_Leopard2A6M_Fleck"                      // MBT Leopard 2A6M
        ];
        _Unit_Pool_A = [
            "BWA3_Tiger_Gunpod_PARS",                      // UH Tiger GunPod (PARS)
            "BWA3_Tiger_Gunpod_FZ",                        // UH Tiger GunPod (FZ)
            "BWA3_Tiger_Gunpod_Heavy",                     // UH Tiger GunPod (Heavy)
            "BWA3_Tiger_RMK_PARS",                         // UH Tiger RMK (PARS)
            "BWA3_Tiger_RMK_Universal",                    // UH Tiger RMK (Universal)
            "BWA3_Tiger_RMK_FZ",                           // UH Tiger RMK (FZ)
            "BWA3_Tiger_RMK_Heavy"                         // UH Tiger RMK (Heavy)
        ];
    };

    //===================================================================================================//
    // BW: Bundeswehr (Tropentarn)                                                                       //
    //===================================================================================================//
    case 31: {
        _Unit_Pool_S = [
            "BWA3_Crew_Fleck","BWA3_Helipilot","BWA3_TL_Tropen",  // Crew, Helicopter Pilot and Squad Leader
            "BWA3_TL_Tropen",                                     // Fireteam Leader
            "BWA3_Rifleman_Tropen",                               // Rifleman
            "BWA3_Rifleman_lite_Tropen",                          // Light Rifleman
            "BWA3_Rifleman_unarmed_Tropen",                       // Rifleman (Unarmed)
            "BWA3_RiflemanG27_Tropen",                            // Rifleman (G27)
            "BWA3_RiflemanG28_Tropen",                            // Rifleman (G28)
            "BWA3_Grenadier_Tropen",                              // Grenadier
            "BWA3_GrenadierG27_Tropen",                           // Grenadier (G27)
            "BWA3_Autorifleman_Tropen",                           // Automatic Rifleman
            "BWA3_AutoriflemanMG5_Tropen",                        // Automatic Rifleman (MG5)
            "BWA3_CombatLifeSaver_Tropen",                        // Combat Life Saver
            "BWA3_Marksman_Tropen",                               // Designated Marksman
            "BWA3_SniperG82_Tropen",                              // Sniper
            "BWA3_Spotter_Tropen",                                // Spotter
            "BWA3_RiflemanAT_RGW90_Tropen",                       // Anti-Tank (RGW90)
            "BWA3_RiflemanAT_Pzf3_Tropen",                        // Anti-Tank (Panzerfaust 3)
            "BWA3_RiflemanAA_Fliegerfaust_Tropen",                // Anti-Aircraft (Fliegerfaust)
            "BWA3_Engineer_Tropen"                                // Engineer
        ];
        _Unit_Pool_V = [];
        _Unit_Pool_T = [
            "BWA3_Puma_Tropen",                            // IFV Puma
            "BWA3_Leopard2A6M_Tropen"                      // MBT Leopard 2A6M
        ];
        _Unit_Pool_A = [
            "BWA3_Tiger_Gunpod_PARS",                      // UH Tiger GunPod (PARS)
            "BWA3_Tiger_Gunpod_FZ",                        // UH Tiger GunPod (FZ)
            "BWA3_Tiger_Gunpod_Heavy",                     // UH Tiger GunPod (Heavy)
            "BWA3_Tiger_RMK_PARS",                         // UH Tiger RMK (PARS)
            "BWA3_Tiger_RMK_Universal",                    // UH Tiger RMK (Universal)
            "BWA3_Tiger_RMK_FZ",                           // UH Tiger RMK (FZ)
            "BWA3_Tiger_RMK_Heavy"                         // UH Tiger RMK (Heavy)
        ];
    };

    //===================================================================================================//
    // BW: Bundeswehr Fernspäher (Flecktarn)                                                             //
    //===================================================================================================//
    case 32: {
        _Unit_Pool_S = [
            "BWA3_Crew_Fleck","BWA3_Helipilot","BWA3_recon_TL_Fleck",  // Crew, Helicopter Pilot and Squad Leader
            "BWA3_recon_Fleck",                                        // Fernspäher Scout
            "BWA3_recon_LAT_Fleck",                                    // Fernspäher Light AT (RGW90)
            "BWA3_recon_Pioneer_Fleck",                                // Fernspäher Pioneer
            "BWA3_recon_Medic_Fleck",                                  // Fernspäher Paramedic
            "BWA3_recon_Marksman_Fleck",                               // Fernspäher Designated Marksman
            "BWA3_recon_Radioman_Fleck"                                // Fernspäher Radioman
        ];
        _Unit_Pool_V = [];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // BW: Bundeswehr Fernspäher (Tropentarn)                                                            //
    //===================================================================================================//
    case 33: {
        _Unit_Pool_S = [
            "BWA3_Crew_Tropen","BWA3_Helipilot","BWA3_recon_TL_Tropen", // Crew, Helicopter Pilot and Squad Leader
            "BWA3_recon_Tropen",                                        // Fernspäher Scout
            "BWA3_recon_LAT_Tropen",                                    // Fernspäher Light AT (RGW90)
            "BWA3_recon_Pioneer_Tropen",                                // Fernspäher Pioneer
            "BWA3_recon_Medic_Tropen",                                  // Fernspäher Paramedic
            "BWA3_recon_Marksman_Tropen",                               // Fernspäher Designated Marksman
            "BWA3_recon_Radioman_Tropen"                                // Fernspäher Radioman
        ];
        _Unit_Pool_V = [];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // (LOP) Leights Opfor Pack: Afghan Militia                                                          //
    //===================================================================================================//
    case 40: {
        _Unit_Pool_S = [
            "LOP_AM_Infantry_Engineer", "LOP_AM_Infantry_Engineer", "LOP_AM_Infantry_SL",  // Crew, Helicopter pilot and Section Leader
            "LOP_AM_Infantry_TL",          // Team Leader
            "LOP_AM_Infantry_AT",          // Anti-Tank (RPG-7)
            "LOP_AM_Infantry_AT_Asst",     // Anti-Tank assistant
            "LOP_AM_Infantry_AR",          // Machinegunner (PKM)
            "LOP_AM_Infantry_AR_Asst",     // Machinegunner
            "LOP_AM_Infantry_Corpsman",    // Corpsman
            "LOP_AM_Infantry_Engineer",    // IED man (Engineer)
            "LOP_AM_Infantry_GL",          // Grenadier (AKM GP-25)
            "LOP_AM_Infantry_Marksman",    // Designated Marksman
            "LOP_AM_Infantry_Rifleman",    // Rifleman (AKM)
            "LOP_AM_Infantry_Rifleman_2",  // Rifleman (AKMS)
            "LOP_AM_Infantry_Rifleman_3"   // Rifleman (Lee Enfield)
        ];
        _Unit_Pool_V = [
            "LOP_AM_Landrover",            // Landrover (Unarmed)
            "LOP_AM_Landrover_M2",         // Landrover (M2)
            "LOP_AM_Offroad",              // Technical (Unarmed)
            "LOP_AM_Offroad_M2",           // Technical (M2)
            "LOP_AM_Truck"                 // Truck (cargo)
        ];
        _Unit_Pool_T = [
            "LOP_AM_BTR60",                // BTR 60
            "LOP_AM_M113_W",               // M113A3
            "LOP_AM_T72BA"                 // T-72B (obr. 1984g.)
        ];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // (LOP) Leights Opfor Pack: Takistan Civilians                                                      //
    //===================================================================================================//
    case 41: {
        _Unit_Pool_S = [
            "LOP_Tak_Civ_Man_01",
            "LOP_Tak_Civ_Man_02",
            "LOP_Tak_Civ_Man_03",
            "LOP_Tak_Civ_Man_04"
        ];
        _unit_Pool_V = [
            "LOP_TAK_Civ_Offroad",
            "LOP_TAK_Civ_Hatchback",
            "LOP_TAK_Civ_Landrover",
            "LOP_TAK_Civ_Ural",
            "LOP_TAK_Civ_Ural_open",
            "LOP_TAK_Civ_UAZ",
            "LOP_TAK_Civ_UAZ_Open"
        ];
        _Unit_Pool_T = [];
        _Unit_Pool_A = [];
    };

    //===================================================================================================//
    // DEFAULT                                                                                           //
    //===================================================================================================//
    Default {
        if (DAC_Basic_Value != 5) then {
            DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
            hintc "Error: DAC_Config_Units > No valid config number";
        };
        if (true) exitwith {};
    };
};

if (count _this == 2) then {
    _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
} else {
    _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray

//============================================= END OF FILE =============================================//
