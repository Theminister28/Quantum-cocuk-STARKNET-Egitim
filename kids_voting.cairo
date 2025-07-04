 starknet

from starkware.cairo.common.math import assert_nn

# Çocuklar için basit oylama sistemi
@storage_var
func votes(candidate: felt) -> (count: felt):
end

@external
func vote{caller_address: felt}(candidate: felt):
    # Sadece 1-5 arası adaylara oy verilebilir
    assert_nn(candidate)
    assert candidate <= 5  # max 5 aday
    
    let current_count = votes.read(candidate)
    votes.write(candidate, current_count + 1)
    return ()
end

@view
func get_votes{caller_address: felt}(candidate: felt) -> (count: felt):
    let res = votes.read(candidate)
    return (count=res)
end
