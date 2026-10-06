from pathlib import Path


config.load_autoconfig(False)

noctalia_theme = Path.home() / '.config' / 'qutebrowser' / 'noctalia' / 'colors.py'
if noctalia_theme.exists():
    config.source(str(noctalia_theme))
