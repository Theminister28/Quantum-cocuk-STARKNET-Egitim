%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin

# Çocuklar için basit NFT sertifika kontratı
@storage_var
func owner_of(certificate_id: felt) -> (owner: felt):
end

@external
func mint_certificate{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(to: felt, certificate_id: felt):
    # Sadece kontrat sahibi mint yapabilir
    let caller = get_caller_address()
    assert caller == OWNER_ADDRESS  # OWNER_ADDRESS tanımlanmalı
    
    owner_of.write(certificate_id, to)
    return ()
end
