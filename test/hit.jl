include(joinpath(dirname(@__FILE__),"..", "src/WebBLAST/", "hit.jl"))	
using BioSeq

# check_threshold tests

test_hit = Hit(1,"gi|18412314|ref|NP_565204.1|","tTest Hit","NP_565204",166,
	[Hsp(1,132.88,2.93692e-37,1,62,0,0,62,62,0,62,
	aminoacid("NQLQQLQNPGESPPVHPFVAPLSYLLGTWRGQGEGEYPTIPSFRYGEEIRFSHSGKPVIAY"),
	"MNQLQQLQNPGESPPVHPFVAPLSYLLGTWRGQGEGEYPTIPSFRYGEEIRFSHSGKPVIAY",
	aminoacid("MNQLQQLQNPGESPPVHPFVAPLSYLLGTWRGQGEGEYPTIPSFRYGEEIRFSHSGKPVIAY"),
	aminoacid("MNQLQQLQNPGESPPVHPFVAPLSYLLGTWRGQGEGEYPTIPSFRYGEEIRFSHSGKPVIAY"))])

@test check_threshold(0.01, test_hit) == true
@test check_threshold(2.9e-38, test_hit) == false

# fastarepresentation test

@test fastarepresentation(test_hit) == ("gi|18412314|ref|NP_565204.1|","MNQLQQLQNPGESPPVHPFVAPLSYLLGTWRGQGEGEYPTIPSFRYGEEIRFSHSGKPVIAY")