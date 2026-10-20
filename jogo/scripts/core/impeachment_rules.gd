class_name ImpeachmentRules
extends RefCounted
## gdd/sistemas/03_impeachment.md — triggers (§3.1), the 5-card scene (§3.2, §4.1) and the
## derived scoreboards (§3.3, docs/14 §14.08). The flow keeps the scene state.

const CAPITAL := "political_capital"
const PHASES := 5
const FROM_YEAR := 2                     # principal, crise e alternativo (§3.1)
const PRINCIPAL_BELOW := 20              # Legitimidade < 20 E Capital Político < 20
const CRISIS_BELOW := 20                 # Integridade < 20 E Consciência < 20
const ALTERNATIVE_STREAK := 3            # 3 opções seguidas que tiram Capital Político
const AUTO_CONVICTION_BELOW := 15        # Consciência < 15 E Integridade < 15 (§3.2.2)
const MIN_SUPPORT := 2                   # §3.2.4
const MIN_SUPPORT_CAPITAL_ZERO := 3
const ACQUITTAL_CAPITAL_MIN := 20        # §3.2.5
const ACQUITTAL_LEGITIMACY := 10
const CHAMBER_TOTAL := 513               # §3.3, docs/14 §14.08
const CHAMBER_QUORUM := 342
const SENATE_TOTAL := 81
const SENATE_QUORUM := 54


## Meter triggers checked at closing step 6 (§3.1); Capital em 0 counts in any year.
static func closing_triggers(meters: Dictionary, year: int) -> Array:
	var out: Array = []
	var capital := int(meters[CAPITAL])
	if capital == 0:
		out.append("capital_zero")
	if year >= FROM_YEAR:
		if int(meters["legitimacy"]) < PRINCIPAL_BELOW and capital < PRINCIPAL_BELOW:
			out.append("principal")
		if int(meters["integrity"]) < CRISIS_BELOW and int(meters["awareness"]) < CRISIS_BELOW:
			out.append("crisis")
	return out


static func alternative_fires(streak: int, year: int) -> bool:
	return year >= FROM_YEAR and streak >= ALTERNATIVE_STREAK


static func min_support(triggers: Array) -> int:
	return MIN_SUPPORT_CAPITAL_ZERO if triggers.has("capital_zero") else MIN_SUPPORT


static func automatic_conviction(meters: Dictionary) -> bool:
	return int(meters["awareness"]) < AUTO_CONVICTION_BELOW and int(meters["integrity"]) < AUTO_CONVICTION_BELOW


## The option's test {meter, op, value} with the value **before** the card's effect (§3.2.3).
static func test_passes(test: Dictionary, meters: Dictionary) -> bool:
	return MeterRules.compare(int(meters[test["meter"]]), String(test["op"]), int(test["value"]))


## Absolvição: apoio ≥ mín E teste do Desfecho (§4.1).
static func acquitted(support: int, needed: int, final_test_passed: bool) -> bool:
	return support >= needed and final_test_passed


## Capital Político = máx(atual; 20); Legitimidade +10 (§3.2.5), as flat effects.
static func acquittal_effects(meters: Dictionary) -> Dictionary:
	var capital := int(meters[CAPITAL])
	return {CAPITAL: maxi(capital, ACQUITTAL_CAPITAL_MIN) - capital, "legitimacy": ACQUITTAL_LEGITIMACY}


## Scoreboard of a phase (§3.3). `lost` is null before the choice. Numbers the repo does
## not define stay null (UI shows "[a definir]"): committee size, quorum and count, and the
## count of a vote the government wins ("abaixo do mínimo").
static func scoreboard(phase: int, lost: Variant) -> Dictionary:
	match phase:
		2:
			return {"kind": "committee", "total": null, "quorum": null, "votes": null,
				"reached": lost}
		3:
			return {"kind": "chamber", "total": CHAMBER_TOTAL, "quorum": CHAMBER_QUORUM,
				"votes": CHAMBER_QUORUM if lost == true else null, "reached": lost}
		4:
			# Só a meta (— / 81, quórum 54); a barra aparece no resultado (D-168).
			return {"kind": "senate", "total": SENATE_TOTAL, "quorum": SENATE_QUORUM,
				"votes": null, "reached": null}
	return {}


## Senate at the result: 54 of 81 on conviction (§3.3).
static func result_scoreboard(convicted: bool) -> Dictionary:
	return {"kind": "senate", "total": SENATE_TOTAL, "quorum": SENATE_QUORUM,
		"votes": SENATE_QUORUM if convicted else null, "reached": convicted}
