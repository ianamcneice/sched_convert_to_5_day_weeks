exception NoConfig

type shift =
  | onshift | offshift

type offshift =
  | Off | Pto | Hc | Stat

type onshift =
  | Seven | Eight | Nine | Ten | Eleven | Twelve | Three

type name = string

type weekday = | Sun | Mon | Tue | Wed | Thu | Fri | Sat

type date = (weekday * int)

type market = Tuscany | FrAlps | London | CapeTown | Mykonos
  | RivMaya | PuntaMita | CostaRica | Dr | Cabo | Pv
  | Anguilla | StBarts | Bahamas | Turks | Barbados | Jamaica | Dr | Cayman
  | LA | NapSon | Palm Springs | Oahu | BigIs | Maui | Vail | ParkCity | Breck | Steamboat
  | Bali | KohSam | Phuket

(*
schedules are of the following form:
name | market  | Wed 1 | Thu 2 | Fri 3  | ...
-----------------------------------------
"A"  | [Dr;Pv] | Nine  | Nine  | Twelve | ...
"B"  | [LA]    | Three | Three | Three  | ...
...  | ...     | ...   | ...   | ...    | ...

*)
type schedule = ((name * market list) * ((date * shift) list)) list

(* val to_5daywks : schedule -> schedule
A function taking a schedule and trying to output a schedule of equivalent
daily market coverage, BUT with maximum 5 consecutive workdays (onshift) followed
by at least 2 consecutive days off (offshift)

If not possible, raises error NoConfig
*)

let to_5daywks s = raise NoConfig
