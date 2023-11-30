import mods.devtech.machines.RegisterMachine;
import mods.devtech.machines.Overlays;
import mods.devtech.IRecipeMap;
import mods.devtech.GUITextures;
import mods.devtech.OverlaySlot;
import mods.devtech.MoveType;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.RecipeMaps;
import mods.devtech.OverlayFace;
import mods.devtech.OverlayRenderer;


var microscope = IRecipeMap.recipeMapBuilder("microscope",0,1,0,9,0,0,0,0)
    .setOverlaySlots(OverlaySlot.newOverlaySlot(false, false,false,GUITextures.get("hammer_overlay")))
    .setProgressBar(GUITextures.get("progress_bar_bending"), MoveType.VERTICAL)
    .build();
    
RegisterMachine.CreateSimpleMachine(1424, "microscope.hv", microscope, Overlays.get("assembler"),3);
RegisterMachine.CreateSimpleMachine(1425, "microscope.ev", microscope, Overlays.get("assembler"), 4);
RegisterMachine.CreateSimpleMachine(1426, "microscope.iv", microscope, Overlays.get("assembler"), 5);