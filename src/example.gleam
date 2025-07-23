import gleam/io
import sha3
import simplifile

pub fn main() {
  let message = "Hello, World!"

  io.println("SHA-3 Hash Examples")
  io.println("==================")
  io.println("Message: " <> message)
  io.println("")

  case sha3.hash_string(message, sha3.Sha3224) {
    Ok(hash) -> {
      let hex = sha3.to_hex(hash)
      let expected = "853048fb8b11462b6100385633c0cc8dcdc6e2b8e376c28102bc84f2"
      io.println("SHA3-224: " <> hex)
      case hex == expected {
        True -> io.println("✓ SHA3-224 assertion passed")
        False ->
          io.println("✗ SHA3-224 assertion failed - expected: " <> expected)
      }
    }
    Error(err) -> io.println("Error: " <> err)
  }

  io.println("")

  case sha3.hash_string(message, sha3.Sha3256) {
    Ok(hash) -> {
      let hex = sha3.to_hex(hash)
      let expected =
        "1af17a664e3fa8e419b8ba05c2a173169df76162a5a286e0c405b460d478f7ef"
      io.println("SHA3-256: " <> hex)
      case hex == expected {
        True -> io.println("✓ SHA3-256 assertion passed")
        False ->
          io.println("✗ SHA3-256 assertion failed - expected: " <> expected)
      }
    }
    Error(err) -> io.println("Error: " <> err)
  }

  io.println("")

  case sha3.hash_string(message, sha3.Sha3384) {
    Ok(hash) -> {
      let hex = sha3.to_hex(hash)
      let expected =
        "aa9ad8a49f31d2ddcabbb7010a1566417cff803fef50eba239558826f872e468c5743e7f026b0a8e5b2d7a1cc465cdbe"
      io.println("SHA3-384: " <> hex)
      case hex == expected {
        True -> io.println("✓ SHA3-384 assertion passed")
        False ->
          io.println("✗ SHA3-384 assertion failed - expected: " <> expected)
      }
    }
    Error(err) -> io.println("Error: " <> err)
  }

  io.println("")

  case sha3.hash_string(message, sha3.Sha3512) {
    Ok(hash) -> {
      let hex = sha3.to_hex(hash)
      let expected =
        "38e05c33d7b067127f217d8c856e554fcff09c9320b8a5979ce2ff5d95dd27ba35d1fba50c562dfd1d6cc48bc9c5baa4390894418cc942d968f97bcb659419ed"
      io.println("SHA3-512: " <> hex)
      case hex == expected {
        True -> io.println("✓ SHA3-512 assertion passed")
        False ->
          io.println("✗ SHA3-512 assertion failed - expected: " <> expected)
      }
    }
    Error(err) -> io.println("Error: " <> err)
  }

  io.println("")

  io.println("Testing with empty string:")
  case sha3.hash_string("", sha3.Sha3256) {
    Ok(hash) -> {
      let hex = sha3.to_hex(hash)
      let expected =
        "a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a"
      io.println("SHA3-256 (empty): " <> hex)
      case hex == expected {
        True -> io.println("✓ Empty string assertion passed")
        False ->
          io.println("✗ Empty string assertion failed - expected: " <> expected)
      }
    }
    Error(err) -> io.println("Error: " <> err)
  }

  io.println("")
  io.println("Binary File Examples")
  io.println("===================")

  let file_path = "test/binary_test/zero1M.bin"
  case simplifile.read_bits(file_path) {
    Ok(file_data) -> {
      io.println("Successfully loaded binary file: " <> file_path)

      case sha3.hash(file_data, sha3.Sha3224) {
        Ok(hash) -> {
          let hex = sha3.to_hex(hash)
          let expected =
            "8440e0366d98ac13845eafeb06f3a01e5c38fde44ef2caef5d8048c6"
          io.println("SHA3-224 (binary): " <> hex)
          case hex == expected {
            True -> io.println("✓ Binary SHA3-224 assertion passed")
            False ->
              io.println(
                "✗ Binary SHA3-224 assertion failed - expected: " <> expected,
              )
          }
        }
        Error(err) -> io.println("Error hashing binary file: " <> err)
      }

      io.println("")

      case sha3.hash(file_data, sha3.Sha3256) {
        Ok(hash) -> {
          let hex = sha3.to_hex(hash)
          let expected =
            "7e1839fd5b1f59802cdf1f098dd5198e49b2a242ec43a5e2f107d2e2e57b0f25"
          io.println("SHA3-256 (binary): " <> hex)
          case hex == expected {
            True -> io.println("✓ Binary SHA3-256 assertion passed")
            False ->
              io.println(
                "✗ Binary SHA3-256 assertion failed - expected: " <> expected,
              )
          }
        }
        Error(err) -> io.println("Error hashing binary file: " <> err)
      }

      io.println("")

      case sha3.hash(file_data, sha3.Sha3384) {
        Ok(hash) -> {
          let hex = sha3.to_hex(hash)
          let expected =
            "030b0057a7765647d67b38c91f9d45ba1aa6813e01da0b128c9ef56b96b334f22fe481754cef9c2bbc3f1d5b43e78ce4"
          io.println("SHA3-384 (binary): " <> hex)
          case hex == expected {
            True -> io.println("✓ Binary SHA3-384 assertion passed")
            False ->
              io.println(
                "✗ Binary SHA3-384 assertion failed - expected: " <> expected,
              )
          }
        }
        Error(err) -> io.println("Error hashing binary file: " <> err)
      }

      io.println("")

      case sha3.hash(file_data, sha3.Sha3512) {
        Ok(hash) -> {
          let hex = sha3.to_hex(hash)
          let expected =
            "7dab0a45cc88755f07291036b88f7a78f455c49e9832813c9e7da5f430a144fc5b6f82ad52bb9620a6aa94d2542fc0b852ab9278fce2fe5d10397ff4901ca4b7"
          io.println("SHA3-512 (binary): " <> hex)
          case hex == expected {
            True -> io.println("✓ Binary SHA3-512 assertion passed")
            False ->
              io.println(
                "✗ Binary SHA3-512 assertion failed - expected: " <> expected,
              )
          }
        }
        Error(err) -> io.println("Error hashing binary file: " <> err)
      }
    }
    Error(err) -> {
      io.println(
        "Could not load binary file ("
        <> file_path
        <> "): "
        <> simplifile.describe_error(err),
      )
      io.println("This is expected if the test file doesn't exist.")
      io.println("Binary file hashing would work the same way with any file.")
    }
  }

  io.println("")
  io.println("All examples completed!")
  io.println("Usage Summary:")
  io.println("- sha3.hash_string(text, variant) for text")
  io.println("- sha3.hash(binary_data, variant) for binary data")
  io.println("- sha3.to_hex(hash) to convert to hex string")
  io.println("- simplifile.read_bits(path) to load binary files")
}
