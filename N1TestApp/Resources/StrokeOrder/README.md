# Stroke order data

`strokes.json` contains the ordered SVG path data and stroke number positions
for the characters used in `N1_vocab.csv`, plus the standard hiragana and
katakana characters (including voiced, semi-voiced, small kana, and the
long-vowel mark). It was extracted from
[KanjiVG](https://kanjivg.tagaini.net/) (copyright © KanjiVG contributors).
The paths are shown in their original direction and order.

This data is licensed under
[Creative Commons Attribution-ShareAlike 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
The full license is in `COPYING`. The app's Swift and HTML presentation code
is separate from the stroke data.

Regenerate the compact data from a KanjiVG checkout with:

```sh
python3 Scripts/generate_stroke_order.py /path/to/kanjivg
```
