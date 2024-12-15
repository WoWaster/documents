data Literal = LitInt Int | LitChar Char | LitString Text

type DataCon = Name

newtype Var = Id Name

data Expr b
  = Var b
  | Lit Literal
  | App (Expr b) (Expr b)
  | Lam b (Expr b)
  | Let (Bind b) (Expr b)
  | Match (Expr b) b (NonEmpty (MatchAlt b))
  | Tuple (Expr b) (NonEmpty (Expr b))

type MatchAlt b = (AltCon, [b], Expr b)

data AltCon = DataAlt DataCon | LitAlt Literal | TupleAlt | DEFAULT

data Bind b = NonRec b (Expr b) | Rec (NonEmpty (b, Expr b))

type CoreExpr = Expr Var
type CoreMatchAlt = MatchAlt Var
type CoreBind = Bind Var
