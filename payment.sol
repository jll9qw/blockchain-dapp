pragma solidity >=0.7.0 <0.9.0;

// For Loop Practice

contract Payment {
    uint256 payment;
    address payable[] investorWallets;
    mapping(address => uint256) investors;

    function payInvestors(address payable wallet, uint256 amount) public {
        investorWallets.push(wallet);
        investors[wallet] = amount;
    }

    function payout() private {
        for (uint256 i = 0; i < investorWallets.length; i++) {
            investorWallets[i].transfer(investors[investorWallets[i]]);
        }
    }

    constructor() public payable {
        fortune = msg.value;
    }

    function makePayment() public {
        payout();
    }

    function checkInvestors() pubilc view returns (uint256) {
        return investorWallets.length;
    }
}
