module Player exposing (takeTurn)

import Warrior exposing (Warrior)
import Warrior.History exposing (History)
import Warrior.Map exposing (Map)
import Warrior.Direction exposing (..)
import Warrior.Coordinate exposing (Coordinate)
import Warrior.Map.Tile exposing (Tile)
import Warrior.Map.Tile exposing (canMoveOnto)

type Motion = Right | Left | Up | Down

takeTurn : Warrior -> Map -> History -> Warrior.Action
takeTurn warrior map history =
    getAction warrior map Right

getAction warrior map motion =
    let
        canMove direction = 
            Warrior.Map.look direction warrior map
            |> List.head
            |> Maybe.map Tuple.second
            |> Maybe.map Warrior.Map.Tile.canMoveOnto
            |> Maybe.withDefault False
    in
    
    case motion of
    Right -> 
            Warrior.Direction.Right
            |> Warrior.Move

    Left ->         
            Warrior.Direction.Left
            |> Warrior.Move

    Up ->
            Warrior.Direction.Up
            |> Warrior.Move

    Down -> 
            Warrior.Direction.Down
            |> Warrior.Move

    -- Warrior.Direction.all
    --     |> List.filter canMove
    --     |> List.head
    --     |> Maybe.map Warrior.Move
    --     |> Maybe.withDefault Warrior.Wait


