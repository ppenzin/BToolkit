(Rename_VAL(vv;?) == (vv : UNSIGNED));
(Rename_STO(?;vv) == (vv : UNSIGNED));
(Rename_INC(?;?) == ?);
(Rename_DEC(?;?) == ?);
(Rename_ADD(?;vv) == (vv : UNSIGNED));
(Rename_SUB(?;vv) == (vv : UNSIGNED));
(Rename_MUL(?;vv) == (vv : UNSIGNED));
(Rename_DIV(?;vv) == (vv : UNSIGNED));
(Rename_MOD(?;vv) == (vv : UNSIGNED));
(Rename_LEFT(?;?) == ?);
(Rename_RIGHT(?;?) == ?);
(Rename_AND(?;vv) == (vv : UNSIGNED));
(Rename_OR(?;vv) == (vv : UNSIGNED));
(Rename_XOR(?;vv) == (vv : UNSIGNED));
(Rename_NOT(?;?) == ?)
|
(Rename_uns : UNSIGNED)|
(?)
