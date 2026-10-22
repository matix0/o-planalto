class_name Tokens
extends RefCounted
## Design tokens from the final wireframe round (Tokens board; docs/14 §14.11;
## D-151, D-156, D-159, D-162, D-165, D-169, D-170, D-171, D-172).
## Every UI measure must come from here.

# --- Colors: interface (neutral palette, D-159/D-172) ---
const BG := Color("#263238")            # screen background
const CARD := Color("#37474F")          # card, sheet, modal, toast, meter well
const CRISIS_BG := Color("#1A1416")     # impeachment scene background (C-10), darker and warm (P-017)
const TEXT := Color("#FFFFFF")          # primary text, primary button, filete, focus ring, alert
const TEXT2 := Color("#B0BEC5")         # secondary text, footer (6.90:1 on BG)
const HIGHLIGHT := Color("#ECEFF1")     # neutral highlight (pulse ring, selection marks)
const OUTLINE := Color("#90A4AE")       # control outlines (5.08:1 on BG, 3.72:1 on CARD)
const INACTIVE := Color("#78909C")      # HUD divider, todo segments, switch off (only on BG)
const PRESSED := Color("#455A64")       # icon button pressed, portrait bg, radar grid
const SCRIM := Color(0, 0, 0, 0.62)     # dimmed background (D-160)
const HC_BG := Color("#000000")         # high contrast (P2, D-169)

# --- Colors: "ideia inicial" palette (D-199, P-017) ---
const ACCENT := Color("#80DEEA")        # speaker, card title, section headers (cyan)
const PRIMARY_BG := Color("#2E7D32")    # primary button (green), hover #296F2D, pressed #256428
const PRIMARY_HOVER := Color("#296F2D")
const PRIMARY_PRESSED := Color("#256428")
const IMPEACH_ACCENT := Color("#EF5350") # impeachment header, "Não" count, critical meter
const MONEY := Color("#F9A825")
const DELTA_GOOD := Color("#A5D6A7")    # always with an arrow and a word
const DELTA_BAD := Color("#FF8A80")
const CRITICAL_AT := 20                  # meter at or below: red edge in the HUD
## One color per meter (ideia inicial, desktop HUD). They share hues with the party colors;
## the party color lives only on the card border, the meter color only in the HUD (D-199).
## Lightened to ≥ 3:1 against the well #37474F (WCAG 1.4.11).
const METER_COLORS := {
	"dignity": Color("#4CAF50"), "awareness": Color("#CE93D8"), "sovereignty": Color("#9FA8DA"),
	"security": Color("#42A5F5"), "integrity": Color("#26A69A"), "treasury": Color("#F9A825"),
	"political_capital": Color("#FF7043"), "legitimacy": Color("#E57373"),
}
const METER_SHORT := {
	"dignity": "DIGN", "awareness": "CONS", "sovereignty": "SOBER", "security": "SEG",
	"integrity": "INTEG", "treasury": "CAIXA", "political_capital": "CAP", "legitimacy": "LEG",
}
## Legend shown when a meter is tapped or hovered (P-017; texts proposed, D-200).
const METER_INFO := {
	"dignity": "Condições de vida: saúde, comida, moradia e combate à fome.",
	"awareness": "Educação, ciência e senso crítico da população.",
	"sovereignty": "Autonomia do país diante de pressões de fora.",
	"security": "Ordem pública e controle da violência.",
	"integrity": "Combate à corrupção e transparência do governo.",
	"treasury": "Dinheiro público disponível para manter o Estado.",
	"political_capital": "Apoio no Congresso para aprovar leis e evitar o impeachment.",
	"legitimacy": "Aprovação popular e confiança das ruas.",
}
## Final screen banner per ending category (ideia inicial: end.* gradients, D-199).
const ENDING_BG := {
	"catastrophe": [Color("#4A1010"), Color("#2A0808"), Color("#EF5350")],
	"extermination": [Color("#4A1010"), Color("#2A0808"), Color("#EF5350")],
	"democracy_loss": [Color("#0D2A4A"), Color("#07121F"), Color("#EF5350")],
	"capture": [Color("#3E1F4F"), Color("#1A0D22"), Color("#CE93D8")],
	"strengthening": [Color("#1B5E20"), Color("#0B2A0F"), Color("#81C784")],
	"care_sovereignty": [Color("#1B5E20"), Color("#0B2A0F"), Color("#81C784")],
	"neutral": [Color("#455A64"), Color("#1C252A"), Color("#F9A825")],
	"exit": [Color("#455A64"), Color("#1C252A"), Color("#F9A825")],
}

# --- Colors: party (only on the card border, D-092) ---
const PARTY := {
	"red": Color("#C62828"),
	"blue": Color("#1565C0"),
	"green": Color("#2E7D32"),
	"yellow": Color("#F9A825"),
	"purple": Color("#6A1B9A"),
	"orange": Color("#EF6C00"),
	"black": Color("#212121"),
}

# --- Colors: meter bands 1..5 [em revisão — TA] (D-162). Index 0 = band 1. ---
const BANDS: Array[Color] = [
	Color("#0097A7"), Color("#00ACC1"), Color("#26C6DA"), Color("#4DD0E1"), Color("#80DEEA"),
]

# --- Spacing scale (esp-N) ---
const ESP_2 := 2
const ESP_4 := 4
const ESP_8 := 8
const ESP_12 := 12
const ESP_16 := 16
const ESP_24 := 24
const ESP_32 := 32
const ESP_48 := 48
const ESP_64 := 64

# --- Radii ---
const RADIUS_8 := 8      # meter well
const RADIUS_12 := 12    # buttons, toast
const RADIUS_16 := 16    # card
const RADIUS_24 := 24    # sheet (top), modal
const RADIUS_PILL := 999

# --- Sizes ---
const VIEWPORT := Vector2i(390, 844)     # D-170
const COLUMN_MAX := 430                  # D-171 (canvas units)
const TOUCH_MIN := 48
const HUD_SIZE := Vector2(342, 70)       # 8 meters with short names (P-017)
const METER_ICON := 32
const METER_GLYPH := 20
const PORTRAIT := 48
const CARD_MAX := Vector2(280, 336)      # 5:6
const CARD_RATIO := 5.0 / 6.0
const FOOTER_MIN := 64
const BORDER_FILETE := 2                 # white / party / white = 2 + 8 + 2 (C-05)
const BORDER_BAND := 8
const BORDER_ARMED_BAND := 12            # PROPOSTA P3
const DOT_SMALL := 6                     # effect dot <= 10 (D-156)
const DOT_BIG := 10
const DOT_RING := 14
const FOCUS_RING := 3
const FOCUS_OFFSET := 4
const OPTION_WIDTH_RATIO := 0.54         # option label box, half facing screen center
const TILT_DEG_AT_LIMIT := 5.0           # a validar

# --- Card gesture (docs/14 §14.04.4) ---
const DRAG_LIMIT_DEFAULT := 0.40         # D-146 (fraction of card width)
const DRAG_LIMIT_MIN := 0.25             # D-158
const FLICK_SPEED := 700.0               # px/s (D-146; unit to test, D-154)
const FLICK_LOCK := 0.22                 # D-153: flick needs text shown or 20-25% travel
const TAP_CONFIRM_DELAY := 0.5           # D-157

# --- Typography per text step (Tokens board, "a validar", D11) ---
const STEPS: Array[int] = [16, 18, 20, 24, 36]
const DEFAULT_STEP := 18
## style -> {step: [size, line_height]}; line_height 0 = font default.
const TYPE := {
	"Display": {16: [56, 0], 18: [64, 0], 20: [64, 0], 24: [72, 0], 36: [56, 0]},   # 36: D-186 smaller titles (DP-009)
	"TitleL": {16: [30, 0], 18: [34, 0], 20: [36, 0], 24: [40, 0], 36: [36, 0]},
	"TitleM": {16: [20, 26], 18: [22, 28], 20: [24, 30], 24: [28, 34], 36: [30, 38]},
	"TitleS": {16: [18, 24], 18: [20, 26], 20: [22, 28], 24: [26, 32], 36: [28, 36]},
	"Body": {16: [16, 24], 18: [18, 26], 20: [20, 28], 24: [24, 32], 36: [36, 44]},
	"Option": {16: [16, 22], 18: [18, 24], 20: [20, 26], 24: [24, 30], 36: [36, 44]},
	"Caption": {16: [14, 20], 18: [16, 22], 20: [18, 24], 24: [20, 28], 36: [30, 40]},
	"Footer": {16: [16, 22], 18: [18, 24], 20: [20, 26], 24: [24, 30], 36: [36, 44]},
	"Quote": {16: [18, 24], 18: [20, 26], 20: [22, 28], 24: [26, 32], 36: [36, 44]},
	"Number": {16: [28, 0], 18: [32, 0], 20: [32, 0], 24: [36, 0], 36: [44, 0]},
}

const METER_NAMES := {
	"dignity": "Dignidade", "awareness": "Consciência", "sovereignty": "Soberania",
	"security": "Segurança", "integrity": "Integridade", "treasury": "Caixa",
	"political_capital": "Capital Político", "legitimacy": "Legitimidade",
}


static func band_of(value: int) -> int:
	## 1..5 (gdd/GDD.md §5.2): 0-20, 21-40, 41-60, 61-80, 81-100.
	if value <= 20:
		return 1
	if value <= 40:
		return 2
	if value <= 60:
		return 3
	if value <= 80:
		return 4
	return 5


static func band_color(value: int) -> Color:
	return BANDS[band_of(value) - 1]


static func type_size(style: String, step: int) -> int:
	return TYPE[style][_step_key(step)][0]


static func type_line(style: String, step: int) -> int:
	return TYPE[style][_step_key(step)][1]


static func _step_key(step: int) -> int:
	return step if STEPS.has(step) else DEFAULT_STEP
