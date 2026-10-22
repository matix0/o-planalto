class_name DisinfoRules
extends RefCounted
## gdd/sistemas/09_desinformacao.md — no mechanic of its own (§3.4): the influencer card's
## `technique` is named on its Learning Card (§3.2). Names: §3.1 (docs/05 §05.10.2).

const TECHNIQUE_NAMES := {
	"demoralization": "Desmoralização",
	"moral_panic": "Pânico Moral",
	"deepfake": "Deepfake",
	"ai_farm": "Fazenda de IA",
	"doom_cache": "Cachê da Desgraça",
	"accusatory_didacticism": "Didatismo Acusatório",
}


## PT-BR name of a technique id; "" when the card has none.
static func technique_name(id: String) -> String:
	if id == "":
		return ""
	return String(TECHNIQUE_NAMES.get(id, ""))
