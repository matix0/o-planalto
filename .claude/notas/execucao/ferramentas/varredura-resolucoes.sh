#!/bin/bash
# P-018: screenshots of every screen at several window sizes (phone short/tall, desktop).
# usage: varredura-resolucoes.sh <copy of jogo/> <out dir> [sizes...]
# Godot stretch "canvas_items" + "expand": the 390×844 base keeps its width on phones and
# grows sideways on desktop; the 430 px column stays centered (D-170, D-171).
G=${GODOT:?set GODOT to the Godot 4.7.2 binary}
P=$1; OUT=$2; shift 2
SIZES=${@:-"390x680 390x844 412x915 360x780 1280x720 1920x1080"}
for res in $SIZES; do
  mkdir -p "$OUT/$res"
  for s in shot_game shot_shell shot_final shot_impeachment; do
    timeout 600 xvfb-run -a -s "-screen 0 1920x1200x24" "$G" --path "$P" --rendering-driver opengl3 \
      --resolution "$res" -s "res://tests/$s.gd" -- --out="$OUT/$res" > "$OUT/$res-$s.log" 2>&1
  done
  echo "$res: $(ls "$OUT/$res" | wc -l) capturas"
done
