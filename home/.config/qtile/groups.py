"""
Group definitions are here
"""
from libqtile.config import Group

group_definitions = [
    {"name": "1", "label": "", "layout": "columns"},
    {
        "name": "2",
        "label": "",
        "layout": "monadTall",
    },
    {
        "name": "3",
        "label": "",
        "layout": "monadTall",
    },
    {
        "name": "4",
        "label": "",
        "layout": "monadTall",
    },
    {
        "name": "5",
        "label": "",
        "layout": "monadTall",
    },
    {"name": "6", "label": "", "layout": "monadTall"},
    {"name": "7", "label": "﵂", "layout": "monadTall"},
    {"name": "8", "label": "者", "layout": "monadTall"},
    {"name": "9", "label": "阮", "layout": "monadTall"},
]

groups = [Group(**group) for group in group_definitions]
