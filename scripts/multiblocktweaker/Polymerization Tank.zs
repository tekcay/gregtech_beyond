import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.IBlockMatcher;
import mods.gregtech.multiblock.MultiblockAbility;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.FactoryMultiblockShapeInfo;
import mods.gregtech.multiblock.IBlockInfo;
import mods.gregtech.multiblock.IBlockWorldState;
import mods.gregtech.multiblock.Multiblock;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.MetaTileEntities;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.render.ITextureArea;
import mods.gregtech.render.MoveType;
import mods.gregtech.render.ICubeRenderer;
import mods.gregtech.render.Textures;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;


var loc = "polymerization_tank";
var meta = 10010;
val polymerization_tank = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "F~F",
                    "~~~",
                    "F~F")
                .aisle(
                    "CCC",
                    "CCC",
                    "CSC")
                .aisle(
                    "CCC",
                    "C~C",
                    "CCC")
                .aisle(
                    "CCC",
                    "C~C",
                    "CCC")
                .aisle(
                    "CCC",
                    "CCC",
                    "CCC")

                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .whereOr("C", 
                <metastate:gregtech:metal_casing:4>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.INPUT_ENERGY,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .where("F", <metastate:gregtech:frame_steel>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle(
                    "F F",
                    "CCC",
                    "CCC",
                    "CCC",
                    "CCC")
                .aisle(
                    "   ",
                    "SCE",
                    "C C",
                    "C C",
                    "CCC")
                .aisle(
                    "F F",
                    "CCC",
                    "CCC",
                    "CCC",
                    "CCC")
                                   
                .where("C", <metastate:gregtech:metal_casing:4>)
                .where("S", IBlockInfo.controller(loc))
                .where("F", <metastate:gregtech:frame_steel>)
                .where("L", MetaTileEntities.FLUID_IMPORT_HATCH[1], IFacing.south())
                .where("X", MetaTileEntities.FLUID_EXPORT_HATCH[1], IFacing.north())
                .where("E", MetaTileEntities.ENERGY_INPUT_HATCH[2], IFacing.east())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxInputs(2)
                        .maxFluidInputs(2)
                        .maxFluidOutputs(1)
                        .build())
.withZoom(0.5f)
.buildAndRegister() as Multiblock;

recipes.addShapeless(<gregtech:machine:10010>,[<modularmachinery:polytank_controller>]);

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 0}))
    .fluidInputs(<liquid:polybenzimidazoleprepolymerfoam>*120000)
    .fluidOutputs(<liquid:impurepolybenzimidazolesolution>*7000)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 1}))
    .fluidInputs(<liquid:vinyl_acetate>*144)
    .fluidOutputs(<liquid:polyvinyl_acetate>*144)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2596>)
    .fluidInputs(<liquid:vinyl_acetate>*144)
    .fluidOutputs(<liquid:polyvinyl_acetate>*288)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2597>)
    .fluidInputs(<liquid:vinyl_acetate>*144)
    .fluidOutputs(<liquid:polyvinyl_acetate>*432)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2598>)
    .fluidInputs(<liquid:vinyl_acetate>*144)
    .fluidOutputs(<liquid:polyvinyl_acetate>*576)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 1}))
    .fluidInputs(<liquid:vinyl_chloride>*144)
    .fluidOutputs(<liquid:polyvinyl_chloride>*144)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2596>)
    .fluidInputs(<liquid:vinyl_chloride>*144)
    .fluidOutputs(<liquid:polyvinyl_chloride>*288)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2597>)
    .fluidInputs(<liquid:vinyl_chloride>*144)
    .fluidOutputs(<liquid:polyvinyl_chloride>*432)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2598>)
    .fluidInputs(<liquid:vinyl_chloride>*144)
    .fluidOutputs(<liquid:polyvinyl_chloride>*576)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 1}))
    .fluidInputs(<liquid:styrene>*144)
    .fluidOutputs(<liquid:polystyrene>*144)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2596>)
    .fluidInputs(<liquid:styrene>*144)
    .fluidOutputs(<liquid:polystyrene>*288)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2597>)
    .fluidInputs(<liquid:styrene>*144)
    .fluidOutputs(<liquid:polystyrene>*432)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2598>)
    .fluidInputs(<liquid:styrene>*144)
    .fluidOutputs(<liquid:polystyrene>*576)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 1}))
    .fluidInputs(<liquid:tetrafluoroethylene>*144)
    .fluidOutputs(<liquid:polytetrafluoroethylene>*144)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2596>)
    .fluidInputs(<liquid:tetrafluoroethylene>*144)
    .fluidOutputs(<liquid:polytetrafluoroethylene>*288)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2597>)
    .fluidInputs(<liquid:tetrafluoroethylene>*144)
    .fluidOutputs(<liquid:polytetrafluoroethylene>*432)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2598>)
    .fluidInputs(<liquid:tetrafluoroethylene>*144)
    .fluidOutputs(<liquid:polytetrafluoroethylene>*576)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 1}))
    .fluidInputs(<liquid:ethylene>*144)
    .fluidOutputs(<liquid:plastic>*144)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2596>)
    .fluidInputs(<liquid:ethylene>*144)
    .fluidOutputs(<liquid:plastic>*288)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2597>)
    .fluidInputs(<liquid:ethylene>*144)
    .fluidOutputs(<liquid:plastic>*432)
    .duration(200)
    .EUt(12)
    .buildAndRegister();

polymerization_tank.recipeMap.recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:2598>)
    .fluidInputs(<liquid:ethylene>*144)
    .fluidOutputs(<liquid:plastic>*576)
    .duration(200)
    .EUt(12)
    .buildAndRegister();