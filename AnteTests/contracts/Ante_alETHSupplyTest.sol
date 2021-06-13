// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/AnteTest.sol";

// Ante Test to check WstETH+stETH supply never exceeds amount of ETH locked in Lido
contract Ante_alETHSupplyTest is AnteTest("stETH doesn't exceed ETH locked in Lido") {
    // https://etherscan.io/address/0xae7ab96520de3a18e5e111b5eaab095312d7fe84
    address public constant LidoAddr = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    // https://etherscan.io/token/0xae7ab96520de3a18e5e111b5eaab095312d7fe84
    address public constant stETHAddr = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    // https://etherscan.io/token/0x7f39c581f595b53c5cb19bd0b3f8da6c935e2ca0
    address public constant wstETHAddr = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;

    IERC20 public wstETHToken = IERC20(wstETHAddr);
    IERC20 public stETHToken = IERC20(stETHAddr);

    constructor () {
        protocolName = "stETH";
        testedContracts = [LidoAddr];
    }
    
    function checkTestPasses() public view override returns (bool) {
        return (wstETHToken.totalSupply() + stETHToken.totalSupply() <= address(LidoAddr).balance);
    }
}