exception NoConfig
exception ScheduleSizeMismatch
exception NotImplemented

(* assuming the following are interchangeable: 8,9 and 10am starts,
and 11 and 12 starts *)
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

(* A list of how many agents are on which shift per market *)
type coverage = (market * (int * onshift) list) list

(* Helper functions to implement
get_cvrg : schedule -> coverage
  ==> given a schedule, gives the coverage of that schedule
enough_cvrg : coverage -> coverage -> bool
  ==> given two schedule coverages, cn and c, ouputs true if
    s' has as much or more coverage than s, false otherwise
good_days_config : schedule -> bool
  ==> given a schedule, checks if there is a max of 5 onshift
  days in a row and 2 or more offshift days in a row if
  an offshift day is found (i.e. no 1 day weekends). Outputs
  true if so, false otherwise.
eq_sch_size : schedule -> schedule -> bool
  ==> given two schedules, returns true if they are of equal
  size (i.e. same number of agents and dates per agent).
  Returns false otherwise.
*)

let get_cvrg s = raise NotImplemented

let enough_cvrg cn c = raise NotImplemented

let good_days_config s = raise NotImplemented

let eq_sch_size s1 s2 = raise NotImplemented

(* val to_5daywks : schedule -> schedule
A function taking a schedule and trying to output a schedule of equivalent
(or greater) daily market coverage, BUT with maximum 5 consecutive workdays
(onshift) followed by at least 2 consecutive days off (offshift)

If not possible, raises error NoConfig. We'll implement with exception
backtracking and maybe convert to a tail recursive version with continuations
if needed.
*)

let rec to_5daywks s cv acc = match s with
  | [] -> if not(eq_sch_size s acc) then raise ScheduleSizeMismatch
          else(
            if (enough_cvrg (get_cvrg acc) cv) &&
              good_days_config acc then acc
            else
              raise NoConfig
            )
  (* This will likely be the hardest part to implement.
   * How to best build an alternative schedule to check? Will need
   * to think about this. Might need nested try-with's?
   *)
  | ag::ags ->
    try
      raise NotImplemented
    with
      NoConfig -> raise NotImplemented

(* Once finished, to_5daywks should be called as:
      to_5daywks s (get_cvrg s) []
    (might need more complicated accumulator but will keep []
    for now)
*)
