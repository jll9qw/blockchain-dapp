pragma solidity >=0.7.0 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;

    //constructor functions fire off during deployment
    constructor() payable public {
        owner = msg.sender; // represents addrdess being called
        fortune = msg.value; // details transaction amount
        deceased = false;
    }
    // Creating a modifier
    modifier onlyOwner (){
        require(msg.sender == owner);
        _;
    }
        // Checks a bool a modifier
    modifier isDeceased (){
        require(deceased == true);
        _;
    }
    address payable [] familyWallets;

    // Key Store value using a map
    mapping(address => uint) inheritance;
    // set inheritance for each address
function setInheritance(address payable wallet, uint amount) public{
familyWallets.push(wallet);
inheritance[wallet] =amount;    }

// Creating a For Loop
// Pay each family member based on their wallet address
function payout() private isDeceased {

for(uint i=0; i<familyWallets.length; i++){
    // transfering funds from contract address to reciever address
    familyWallets[i].transfer(inheritance[familyWallets[i]]);
    }
    }
    // oracle switch simulation that changes the status to true
function setDeceased() public onlyOwner{
    deceased = true;
    payout();
}
}