// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 1. To mint tokens = _mint()
// 2. To transfer tokens = _transfer()
// 3. To burn tokens = _burn()

contract DegenToken is ERC20 {

    string public tokenName = "DEGEN TOKEN";
    string public tokenSymbol = "DGN";
    mapping (address => string[]) purchases;
    address public owner;


    constructor() ERC20(tokenName, tokenSymbol){
        _mint(msg.sender, 5000);
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Sorry! only owner can mint tokens!");
        _;
    }

    // Mint function
    function mintTokens(address _receiver, uint256 _tokens) public onlyOwner{
        require(_receiver != address(0), "This address doesn't exist");
        require(_tokens > 0, "You can't mint negative number of tokens");
        _mint(_receiver, _tokens);
    }

    // Game Shop
    function shopItems() public pure returns(string memory) {
        return "1. DILUC SKIN [700 DGN] 2. AYAKA SKIN [500 DGN] 3. SINGLE PULL [160 DGN] 4. MULTI PULL [350 DGN]";
    }

    // Function to redeem tokens
    function redeemTokens(uint _ch) external{
        require(_ch <= 4,"Wrong option selected!");

        if(_ch == 1){
            require(balanceOf(msg.sender)>=700, "Oops! Insufficient Tokens");
            _burn(msg.sender, 700);
            purchases[msg.sender].push("DILUC SKIN");
        }

        else if(_ch ==2){
            require(balanceOf(msg.sender) >= 500, "Oops! Insufficient Tokens");
            _burn(msg.sender, 500);
            purchases[msg.sender].push("AYAKA SKIN");
        }

        else if(_ch == 3){
            require(balanceOf(msg.sender) >= 160, "Oops! Insufficient Tokens");
            _burn(msg.sender, 160);
            purchases[msg.sender].push("SINGLE PULL");
        }

        else{
            require(balanceOf(msg.sender) >= 350, "Oops! Insufficient Tokens");
            _burn(msg.sender, 350);
            purchases[msg.sender].push("MULTI PULL");
        }

    }

    function myPurchases() public view returns (string[] memory, uint256){
        uint256 length = purchases[msg.sender].length;
        require(length > 0, "No purchases found for this address");
        return (purchases[msg.sender], length);
    }
    
    // Transfer Tokens Function
    function transferTokens(address _reciever, uint _tokens) external{
        require(balanceOf(msg.sender) >= _tokens, "Sorry, not enough balance in wallet.");
        transfer(_reciever, _tokens);
    }

    // Function to check token balance
    function checkTokenBalance() external view returns(uint){
        return balanceOf(msg.sender);
    }

    // Function to burn tokens
    function burnTokens(uint _tokens) external{
        require(balanceOf(msg.sender)>= _tokens, "You don't have enough tokens!");
        _burn(msg.sender, _tokens);
    }

}
