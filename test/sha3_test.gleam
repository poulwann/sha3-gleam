import gleeunit
import gleeunit/should
import sha3
import simplifile

pub fn main() {
  gleeunit.main()
}

pub fn sha3_224_test() {
  let data = "Hello, World!"

  sha3.hash_string(data, sha3.Sha3224)
  |> should.be_ok
  |> sha3.to_hex
  |> should.equal("853048fb8b11462b6100385633c0cc8dcdc6e2b8e376c28102bc84f2")
}

pub fn sha3_256_test() {
  let data = "Hello, World!"

  sha3.hash_string(data, sha3.Sha3256)
  |> should.be_ok
  |> sha3.to_hex
  |> should.equal(
    "1af17a664e3fa8e419b8ba05c2a173169df76162a5a286e0c405b460d478f7ef",
  )
}

pub fn sha3_384_test() {
  let data = "Hello, World!"

  sha3.hash_string(data, sha3.Sha3384)
  |> should.be_ok
  |> sha3.to_hex
  |> should.equal(
    "aa9ad8a49f31d2ddcabbb7010a1566417cff803fef50eba239558826f872e468c5743e7f026b0a8e5b2d7a1cc465cdbe",
  )
}

pub fn sha3_512_test() {
  let data = "Hello, World!"

  sha3.hash_string(data, sha3.Sha3512)
  |> should.be_ok
  |> sha3.to_hex
  |> should.equal(
    "38e05c33d7b067127f217d8c856e554fcff09c9320b8a5979ce2ff5d95dd27ba35d1fba50c562dfd1d6cc48bc9c5baa4390894418cc942d968f97bcb659419ed",
  )
}

pub fn empty_string_test() {
  let data = ""

  sha3.hash_string(data, sha3.Sha3256)
  |> should.be_ok
  |> sha3.to_hex
  |> should.equal(
    "a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a",
  )
}

pub fn binary_file_all_variants_test() {
  let file_path = "test/binary_test/zero1M.bin"

  case simplifile.read_bits(file_path) {
    Ok(file_data) -> {
      sha3.hash(file_data, sha3.Sha3224)
      |> should.be_ok
      |> sha3.to_hex
      |> should.equal(
        "8440e0366d98ac13845eafeb06f3a01e5c38fde44ef2caef5d8048c6",
      )

      sha3.hash(file_data, sha3.Sha3256)
      |> should.be_ok
      |> sha3.to_hex
      |> should.equal(
        "7e1839fd5b1f59802cdf1f098dd5198e49b2a242ec43a5e2f107d2e2e57b0f25",
      )

      sha3.hash(file_data, sha3.Sha3384)
      |> should.be_ok
      |> sha3.to_hex
      |> should.equal(
        "030b0057a7765647d67b38c91f9d45ba1aa6813e01da0b128c9ef56b96b334f22fe481754cef9c2bbc3f1d5b43e78ce4",
      )

      sha3.hash(file_data, sha3.Sha3512)
      |> should.be_ok
      |> sha3.to_hex
      |> should.equal(
        "7dab0a45cc88755f07291036b88f7a78f455c49e9832813c9e7da5f430a144fc5b6f82ad52bb9620a6aa94d2542fc0b852ab9278fce2fe5d10397ff4901ca4b7",
      )
    }
    Error(_) -> {
      // If file doesn't exist, skip the test
      should.be_true(True)
    }
  }
}
