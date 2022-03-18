pragma solidity ^0.8.12;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract MoolahCoin is ERC20Capped, Ownable{

    constructor() ERC20("Moolah Coin", "MC") ERC20Capped(100000000000) payable public {}

}
