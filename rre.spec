
using customer_attack as attack
using EtherRentrancy as EtherRentrancy

methods{

    /*withdraw(uint _amount) => DISPATCHER(true)*/
    receive2() => DISPATCHER(true)
    getBalance(address ad) => DISPATCHER(true)


}

rule onree(){
    env e;
    require e.msg.value==1;
    uint _balance=attack.getaBalance(e,e.msg.sender);

    /*EtherRentrancy.deposit(e);*/
    invoke EtherRentrancy.withdraw(e,e.msg.value);

    uint balance_=attack.getaBalance(e,e.msg.sender);

    assert(_balance+e.msg.value!=balance_);

    

}