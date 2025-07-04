# Çocuklar İçin Cairo Temelleri

## 🌟 Cairo Nedir?
Starknet'in akıllı kontrat yazma dili (Web3'ün Türkçe alfabesi gibi)

## 🎮 Basit Örnek
```python
%lang starknet

# Çocuklar için puan saklama
@storage_var
func puanlar(ogrenci: felt) -> (puan: felt):
end

@external
func puan_ekle(ogrenci: felt, eklenen: felt):
    let eski_puan = puanlar.read(ogrenci)
    puanlar.write(ogrenci, eski_puan + eklenen)
    return ()
end
