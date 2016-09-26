(* ::Package:: *)

(* Execute this block to generate UFO *)
SetDirectory[NotebookDirectory[]];
<<FeynRules`;
FR$Parallelize = False;

LoadModel["SM.fr"];
FeynmanGauge = True;
(*LoadRestriction["Cabibbo.rst", "Massless.rst"]*)
WriteUFO[LSM];


(* Execute this block to generate FeynArts output in Feynman gauge *)
SetDirectory[NotebookDirectory[]];
<<FeynRules`;
FR$Parallelize = False;

LoadModel["SM.fr"];
FeynmanGauge = True;
(*LoadRestriction["Cabibbo.rst", "Massless.rst"]*)
WriteFeynArtsOutput[LSM, FlavorExpand->SU2W]


(* Execute this block to generate FeynArts output in unitary gauge *)
SetDirectory[NotebookDirectory[]];
<<FeynRules`;
FR$Parallelize=False;

LoadModel["SM.fr"];
FeynmanGauge=False;
(*LoadRestriction["Cabibbo.rst", "Massless.rst"]*)
WriteFeynArtsOutput[LGauge, LHiggs, LFermions, LYukawa, FlavorExpand->SU2W, Output->"Standard_Model_FA_Unitary"]


(* ::Subchapter:: *)
(*Model Validation*)


(* Execute this block to check the validity of the input *)
SetDirectory[NotebookDirectory[]];
<<FeynRules`;
FR$Parallelize = False;
LoadModel["SM.fr"];
FeynmanGauge = False;


CheckHermiticity[LSM, FlavorExpand->True]


CheckDiagonalMassTerms[LSM]


CheckMassSpectrum[LSM]


CheckDiagonalKineticTerms[LSM]


CheckKineticTermNormalisation[LSM, FlavorExpand->True]


CheckDiagonalQuadraticTerms[LSM]

