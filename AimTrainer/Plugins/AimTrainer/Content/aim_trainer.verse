
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Random}
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
aim_trainer := class(creative_device):

    @editable var Prop : creative_prop = creative_prop{}
    @editable var MinimumPositions : vector3 = vector3{}
    @editable var MaximumPositions : vector3 = vector3{}
    @editable var PropManipulator : prop_manipulator_device = prop_manipulator_device{}
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        PropManipulator.DamagedEvent.Subscribe(OnPropDamaged)
        MoveProps()

    OnPropDamaged(Agent: agent):void=
        MoveProps()
            
    MoveProps():void=
        RandX := GetRandomFloat(MinimumPositions.X, MaximumPositions.X)
        RandY := GetRandomFloat(MinimumPositions.Y, MaximumPositions.Y)
        RandZ := GetRandomFloat(MinimumPositions.Z, MaximumPositions.Z)
        NewPosition := vector3{X:=RandX,Y:= RandY,Z:= RandZ}
        if(Prop.TeleportTo[NewPosition, Prop.GetTransform().Rotation]){}


        
