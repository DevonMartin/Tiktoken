# Tiktoken

Openai's Tiktoken implementation written in Swift for GPT-3 and GPT-4. This is basic implementation from ordinary encode/decode.

And also supports asian characters and emojis.

## Usage

```swift
let encoder = try await Tiktoken.shared.getEncoding()
let encoded = encoder?.encode(value: "這個算法真的太棒了")
print(encoded)
let decoded = encoder?.decode(value: encoded)
print(decoded)
```

## TODO List

- Encode native
- Encode unstable native
- Multithread
- Custom vocab
- Implements cache for loaded encoding
- Add/Improve documentation
- Add support for combine
- Optimization performance
- More testing
