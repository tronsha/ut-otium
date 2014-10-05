// ====================================================================
//  Otium.
//  Copyright (c) 2004-2014 by Stefan Hüsges
// ====================================================================

class MutOtium extends Mutator;

function ModifyPlayer(Pawn Other)
{
    local xpawn Player;

    Player = xPawn(Other);

    if (Player != none) {
        Player.HealthMax = 400;
        Player.Health = 100;
    }
}

event PreBeginPlay()
{
    SetTimer(1.0, true);
}

function Timer()
{
    local Controller C;

    for (C = Level.ControllerList; C != None; C = C.NextController) {
        if (C.Pawn != None && C.Pawn.Health < C.Pawn.HealthMax) {
            if (C.Pawn.Health < 400) {
                if (C.Pawn.Health < 50)
                    C.Pawn.Health += 8;
                else if (C.Pawn.Health < 100)
                    C.Pawn.Health += 7;
                else if (C.Pawn.Health < 150)
                    C.Pawn.Health += 6;
                else if (C.Pawn.Health < 200)
                    C.Pawn.Health += 5;
                else if (C.Pawn.Health < 250)
                    C.Pawn.Health += 4;
                else if (C.Pawn.Health < 300)
                    C.Pawn.Health += 3;
                else if (C.Pawn.Health < 350)
                    C.Pawn.Health += 2;
                else if (C.Pawn.Health < 400)
                    C.Pawn.Health += 1;
            }            
        }
    }
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    if (Other.IsA('TournamentHealth')) {
        return false;
    }
    return true;
}

defaultproperties
{
    GroupName = "Otium"
    FriendlyName = "Otium"
    Description = "Otium"
}
