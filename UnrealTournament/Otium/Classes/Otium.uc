// ====================================================================
//  Otium.
//  Copyright (c) 2001-2014 by Stefan Hüsges
// ====================================================================

class Otium extends Mutator;

function ModifyPlayer(Pawn Other)
{
    if (Other.Health < 100) {
        Other.Health = 100;
    }

    if (NextMutator != None) {
        NextMutator.ModifyPlayer(Other);
    }
}

function PostBeginPlay()
{
    SetTimer(1.0, True);
}

function Timer()
{
    local Pawn P;

	for (P = Level.PawnList; P != None; P = P.NextPawn) {
        if (P.Health < 400) {
            if (P.Health < 50)
                P.Health = P.Health + 8;
            else if (P.Health < 100)
                P.Health = P.Health + 7;
            else if (P.Health < 150)
                P.Health = P.Health + 6;
            else if (P.Health < 200)
                P.Health = P.Health + 5;
            else if (P.Health < 250)
                P.Health = P.Health + 4;
            else if (P.Health < 300)
                P.Health = P.Health + 3;
            else if (P.Health < 350)
                P.Health = P.Health + 2;
            else if (P.Health < 400)
                P.Health = P.Health + 1;
        }
    }
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    if (Other.IsA('TournamentHealth')) {
        return False;
    }
    return True;
}

defaultproperties
{
}
