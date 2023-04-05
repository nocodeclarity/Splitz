# Splitz
Royalty splits on Bitcoin

Clarity Smart Contract for Splitting Royalties
This Clarity smart contract allows collaborators to split royalties between multiple wallets securely and efficiently. It includes features such as setting authorized collaborators, setting the maximum royalty amount, splitting royalties equally between multiple wallets, and splitting royalties over a specified payment interval.

# Features
authorized-collaborators: A data variable that stores a list of authorized collaborators' addresses.
max-royalty-amount: A data variable that stores the maximum allowed royalty amount.
set-authorized-collaborators function: A public function that allows authorized collaborators to set the list of authorized collaborators.
set-max-royalty-amount function: A public function that allows authorized collaborators to set the maximum allowed royalty amount.
authorized-collaborator? function: A private function that checks if the sender of the transaction is an authorized collaborator.
split-royalties function: A public function that splits the requested royalty amount equally among the authorized collaborators' addresses provided in the function call.
royalty-split event: An event that logs the sender's address and the split amounts for each transaction that splits the royalties.
split-royalties-timed function: A public function that splits the requested royalty amount equally between the authorized collaborators' addresses provided in the function call over a specified payment interval.

# Usage
To use this smart contract, you can deploy it to a supported blockchain network such as Stacks 2.0. Once deployed, you can interact with the smart contract through function calls using the Clarity programming language. Here are the available functions and their parameters:

+ set-authorized-collaborators(addresses: (buff 20)[]): Sets the list of authorized collaborators' addresses.

+ set-max-royalty-amount(amount: uint128): Sets the maximum allowed royalty amount.

+ split-royalties(amount: uint128, addresses: (buff 20)[]): Splits the requested royalty amount equally between the provided addresses.

+ split-royalties-timed(amount: uint128, addresses: (buff 20)[], interval: uint128): Splits the requested royalty amount equally between the provided addresses over a specified payment interval.

# License
This Clarity smart contract is licensed under the MIT License. Feel free to use, modify, and distribute it as needed.
