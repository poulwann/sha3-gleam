//// SHA-3 cryptographic hash functions for Gleam
//// 
//// This library provides SHA-3 hash functions including SHA3-224, SHA3-256,
//// SHA3-384, and SHA3-512 variants from Erlangs sha3/0
//// https://www.erlang.org/doc/apps/crypto/crypto.html#t:sha3/0

import gleam/bit_array
import gleam/string

pub type Sha3Variant {
  Sha3224
  Sha3256
  Sha3384
  Sha3512
}

pub fn hash(data: BitArray, variant: Sha3Variant) -> Result(BitArray, String) {
  case variant {
    Sha3224 -> do_hash_sha3_224(data)
    Sha3256 -> do_hash_sha3_256(data)
    Sha3384 -> do_hash_sha3_384(data)
    Sha3512 -> do_hash_sha3_512(data)
  }
}

pub fn hash_string(
  data: String,
  variant: Sha3Variant,
) -> Result(BitArray, String) {
  data
  |> bit_array.from_string
  |> hash(variant)
}

pub fn to_hex(hash: BitArray) -> String {
  hash
  |> bit_array.base16_encode
  |> string.lowercase
}

@external(erlang, "sha3_ffi", "hash_sha3_224")
fn do_hash_sha3_224(data: BitArray) -> Result(BitArray, String)

@external(erlang, "sha3_ffi", "hash_sha3_256")
fn do_hash_sha3_256(data: BitArray) -> Result(BitArray, String)

@external(erlang, "sha3_ffi", "hash_sha3_384")
fn do_hash_sha3_384(data: BitArray) -> Result(BitArray, String)

@external(erlang, "sha3_ffi", "hash_sha3_512")
fn do_hash_sha3_512(data: BitArray) -> Result(BitArray, String)
