starknet

# Çocuklar için oyun puanlama sistemi
@storage_var
func user_scores(user: felt) -> (score: felt):
end

@external
func add_score{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(user: felt, points: felt):
    let current_score = user_scores.read(user)
    user_scores.write(user, current_score + points)
    return ()
end
