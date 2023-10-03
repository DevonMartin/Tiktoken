# Tiktoken

OpenAI's Tiktoken implementation, rewritten in Swift for GPT-3 and GPT-4. This library provides token estimation using Byte Pair Encoding (BPE).

It supports Latin and Asian characters along with emojis.

## Usage

### Counting Tokens with `Tiktoken`

Use `count` to estimate the number of tokens in a text string. This is especially useful for understanding how many tokens will be consumed in an API call to GPT-3 or GPT-4.

```swift
var concatenatedMessages = ""
for message in messages {
	let role = "role: " + message.role  // system, user or assistant
	let content = "content: " + message.content

	// Include both role and content, separated by spaces
	concatenatedMessages += "\(role) \(content) "
}

// Now count tokens for the whole string
let tiktoken = await Tiktoken()
let count = tiktoken.count(concatenatedMessages)
print("Estimate: \(count)")
```

This function takes a concatenated string that includes all elements expected to be part of the API payload and returns an estimated token count.

### Note: 

The Tiktoken class's initializer is asynchronous. This is to dynamically load essential data from OpenAI needed for token counting.
