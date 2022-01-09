pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    //  Contract allows only the creator to mint coins
    address public minter;
    mapping(address => uint256) public balances;

    // Constuctor only runs during deployment
    constructor() {
        minter = msg.sender;
    }

    // Minting function
    function mint(address receiver, uint256 amount) public {
        // Makes sure the sender is the minter
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    modifier onlyMinter() {
        require(msg.sender == minter);
        _;
    }
    // create an error for NSF
    error NSF(address requested, uint256 available);

    // Sending function
    function send(address receiver, uint256 amount) public {
        if (amount > balances[msg.sender])
            revert NSF({requested: amount, available: balances[msg.sender]});
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }
}
