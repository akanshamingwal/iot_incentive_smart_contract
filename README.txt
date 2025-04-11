
🚀 REMIX DEFAULT WORKSPACE

Remix default workspace is present when:

Remix loads for the very first time

A new workspace is created with the 'Default' template

There are no files existing in the File Explorer


📁 Workspace Structure

This workspace contains 3 directories:

1. contracts/: Holds three contracts with increasing levels of complexity.

Our iot.sol contract

2. scripts/: Contains four TypeScript files to deploy a contract (explained below).

3. tests/: One Solidity test file for the Ballot contract

One JS test file for the Storage contract



🛠️ How to Run the Smart Contract in Remix IDE?

1. Go to MetaMask, and create an account (wallet) for testing.

2. Go to Remix IDE, create an account using the same email as MetaMask.

3. Connect Remix IDE with your MetaMask wallet.

4. Upload iot.sol to the Remix IDE.

5. Compile the smart contract written in Solidity.

6. After compilation, go to Deploy & Run Transactions

7. Use Environment: Remix VM (Cancun) (comes with 10 dummy accounts).

8. Deploy the contract:

The account used for deployment becomes the owner.

9. Register devices from dummy accounts:

Provide three integer parameters: hashPower, transmissionPower, connectivity.

Once devices are registered, test the contract functions:

10. Buttons in Remix IDE are:

🟠 Orange → Create Transactions:

registerDevice, distributeReward, withdrawReward

🔵 Blue → Read-only functions:

11. View total reward, registered devices, contract owner, etc.

12. View detailed logs of each transaction within Remix IDE.
