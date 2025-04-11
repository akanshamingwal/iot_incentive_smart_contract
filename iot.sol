// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ConnectivityAwareIncentives {
    
    struct IoTDevice {
        uint hashPower;
        uint transmissionPower;
        uint connectivity;
        uint rewardBalance;
        bool registered;
    }

    address public owner;
    mapping(address => IoTDevice) public devices;
    address[] public registeredDevices; // List to store registered device addresses
    uint public totalRewardsPool = 10000; // Simple unit, not Ether

    event DeviceRegistered(address device, uint hashPower, uint transmissionPower, uint connectivity);
    event RewardDistributed(address device, uint reward);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerDevice(uint _hashPower, uint _transmissionPower, uint _connectivity) external {
        require(!devices[msg.sender].registered, "Device already registered");
        require(_hashPower > 0 && _transmissionPower > 0 && _connectivity > 0, "Invalid parameters");

        devices[msg.sender] = IoTDevice({
            hashPower: _hashPower,
            transmissionPower: _transmissionPower,
            connectivity: _connectivity,
            rewardBalance: 0,
            registered: true
        });

        registeredDevices.push(msg.sender);

        emit DeviceRegistered(msg.sender, _hashPower, _transmissionPower, _connectivity);
    }

    function calculateReward(address _device) public view returns (uint) {
        IoTDevice memory device = devices[_device];
        require(device.registered, "Device not registered");

        uint baseReward = (device.hashPower * 2 + device.transmissionPower * 15 / 10 + device.connectivity * 3);
        return baseReward;
    }

    function distributeRewards() external onlyOwner {
        for (uint i = 0; i < registeredDevices.length; i++) {
            address device = registeredDevices[i];
            uint reward = calculateReward(device);
            if (totalRewardsPool >= reward) {
                devices[device].rewardBalance += reward;
                totalRewardsPool -= reward;
                emit RewardDistributed(device, reward);
            }
        }
    }

    function withdrawRewards() external {
        require(devices[msg.sender].registered, "Device not registered");
        require(devices[msg.sender].rewardBalance > 0, "No rewards");

        uint amount = devices[msg.sender].rewardBalance;
        devices[msg.sender].rewardBalance = 0;
        // No Ether transfer - only simulation
    }

    function getRegisteredDevices() external view returns (address[] memory) {
        return registeredDevices;
    }
}