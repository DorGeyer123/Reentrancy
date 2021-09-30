pragma solidity 0.7.6;
import "./attack.sol";

interface customer{
    function receive() external payable;


}
contract EtherReentrancy {


    attack at;
    uint x;
    mapping (address => uint256) public balances;
    
    
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
    
    
    function withdraw(uint _amount) public {
        require (balances[msg.sender] >= _amount, "Insufficient funds");
        customer(msg.sender).receive{value: _amount}();
        

        
        
        
        
        /*(bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send funds");*/
        
        balances[msg.sender] -= _amount;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
        
    }
    
}