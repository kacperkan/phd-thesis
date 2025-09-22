#!/usr/bin/env python3

import sys
import re
import os


def fix_polish_spaces(input_file, output_file):
    # Sprawdź czy plik wejściowy istnieje
    if not os.path.exists(input_file):
        print(f"Błąd: Plik {input_file} nie istnieje")
        return False

    # Utwórz kopię zapasową
    backup_file = input_file + ".bak"
    os.system(f"cp {input_file} {backup_file}")

    # Wczytaj zawartość pliku
    try:
        with open(input_file, "r", encoding="utf-8") as f:
            content = f.read()
    except Exception as e:
        print(f"Błąd przy odczycie pliku: {e}")
        return False

    # Lista jednoliterowych spójników
    spojniki = ["a", "i", "o", "u", "w", "z"]

    # Dla każdego spójnika zastąp odpowiednie wzorce
    for s in spojniki:
        # Spacja + spójnik + spacja -> spójnik + niełamiąca spacja
        content = re.sub(f" {s} ", f" {s}~ ", content)
        # Początek linii + spójnik + spacja -> spójnik + niełamiąca spacja
        content = re.sub(f"^{s} ", f"{s}~ ", content, flags=re.MULTILINE)
        content = content.replace("~ ", "~")

    # Zapisz zmodyfikowaną zawartość
    try:
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"Gotowe! Plik z dodanymi niełamiącymi spacjami: {output_file}")
        print(f"Kopia oryginału: {backup_file}")
        return True
    except Exception as e:
        print(f"Błąd przy zapisie pliku: {e}")
        return False


if __name__ == "__main__":
    input_files = [
        "./sections/0_abstracts/polish.tex",
        "./rebuttal_bg.tex",
        "./rebuttal_kk.tex",
    ]
    output_file = [
        "./sections/0_abstracts/polish.tex",
        "./rebuttal_bg.tex",
        "./rebuttal_kk.tex",
    ]

    for input_file, output_file in zip(input_files, output_file):
        success = fix_polish_spaces(input_file, output_file)
        if not success:
            sys.exit(1)
