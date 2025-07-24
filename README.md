# SHA-3 for Gleam

SHA-3 cryptographic hash functions for Gleam, using Erlang's built-in crypto module.

## Installation

Add to your `gleam.toml`:

```toml
[dependencies]
sha3 = { git = "https://github.com/poulwann/sha3-gleam.git", ref = "main" }
```

## Usage

### Basic Usage

```gleam
import sha3

// Hash a string
let result = sha3.hash_string("Hello, World!", sha3.Sha3256)
case result {
  Ok(hash) -> sha3.to_hex(hash)  // Returns hex string
  Error(err) -> err
}

// Hash binary data
let binary_data = <<"Hello, World!":utf8>>
let result = sha3.hash(binary_data, sha3.Sha3256)
```

### Available Variants

- `sha3.Sha3224` - SHA3-224 (224-bit output)
- `sha3.Sha3256` - SHA3-256 (256-bit output)
- `sha3.Sha3384` - SHA3-384 (384-bit output)
- `sha3.Sha3512` - SHA3-512 (512-bit output)

### Complete Example

```gleam
import sha3
import gleam/result

pub fn example() {
  let message = "Hello, World!"
  
  // Hash and convert to hex in one go
  sha3.hash_string(message, sha3.Sha3256)
  |> result.map(sha3.to_hex)
  // Returns: Ok("1af17a664e3fa8e419b8ba05c2a173169df76162a5a286e0c405b460d478f7ef")
}
```

## API Reference

### Types

```gleam
pub type Sha3Variant {
  Sha3224
  Sha3256
  Sha3384
  Sha3512
}
```

### Functions

```gleam
// Hash binary data
pub fn hash(data: BitArray, variant: Sha3Variant) -> Result(BitArray, String)

// Hash string data
pub fn hash_string(data: String, variant: Sha3Variant) -> Result(BitArray, String)

// Convert hash to lowercase hex string
pub fn to_hex(hash: BitArray) -> String

```

## Requirements

- Gleam >= 0.34.0
- Erlang/OTP with crypto module

## License

This project is licensed under the BSD Zero Clause License.
