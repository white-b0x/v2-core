pragma solidity =0.5.16;

import '../ETCswapV2ERC20.sol';

contract ERC20 is ETCswapV2ERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
