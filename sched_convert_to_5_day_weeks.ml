exception NoConfig

(* assuming the following are interchangeable: 8,9 and 10am starts, and 11 and 12 starts*)
type onshift =
  | Seven | Nine | Twelve | Three

  type offshift =
    | Off | Pto | Hc | Stat

type shift =
  | On of (onshift)
  | Off of (offshift)

type name = string

type weekday = | Sun | Mon | Tue | Wed | Thu | Fri | Sat

type date = Date of (weekday * int)

type market = Tuscany | FrAlps | London | CapeTown | Mykonos
  | RivMaya | PuntaMita | CostaRica | Cabo | Pv
  | Anguilla | StBarts | Bahamas | Turks | Barbados | Jamaica | Dr | Cayman
  | LA | NapSon | PalmSprings | Oahu | BigIs | Maui | Vail | ParkCity | Breck | Steamboat
  | Bali | KohSam | Phuket

(*
schedules are of the following form:
name | market  | Wed 1 | Thu 2 | Fri 3  | ...
-----------------------------------------
"A"  | [Dr;Pv] | Nine  | Nine  | Twelve | ...
"B"  | [LA]    | Three | Three | Three  | ...
...  | ...     | ...   | ...   | ...    | ...

[(("A", [Dr;Pv]), [(Date(Wed,1), Nine);(Date(Thu,2), Nine);(Date(Fri,3), Twelve)]);
 (("B", [Dr;Pv]), [(Date(Wed,1), Three);(Date(Thu,2), Three);(Date(Fri,3), Three)])]

*)
type schedule = ((name * market list) * ((date * shift) list)) list

(* val to_5daywks : schedule -> schedule
A function taking a schedule and trying to output a schedule of equivalent
daily market coverage, BUT with maximum 5 consecutive workdays (onshift) followed
by at least 2 consecutive days off (offshift)

If not possible, raises error NoConfig. We'll implement with exception
backtracking and maybe convert to a tail recursive version with continuations
if needed.

First, we need to know the current coverage we'll need to check upon generation
of a potential new schedule.
*)
let to_5daywks s = raise NoConfig
