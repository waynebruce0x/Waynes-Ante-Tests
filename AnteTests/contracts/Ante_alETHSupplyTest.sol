// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/AnteTest.sol";

// Ante Test to check alUSD supply never exceeds amount of DAI locked in Alchemix
contract Ante_alETHSupplyTest is AnteTest("alUSD doesn't exceed DAI locked in Alchemix") {
    // https://etherscan.io/address/0x0100546F2cD4C9D97f798fFC9755E47865FF7Ee6
    address public constant alETHAddr = 0x0100546F2cD4C9D97f798fFC9755E47865FF7Ee6;
    // https://etherscan.io/token/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
    address public constant WETHAddr = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // https://etherscan.io/address/0xa258C4606Ca8206D8aA700cE2143D7db854D168c
    address public constant yvWETHAddr = 0xa258C4606Ca8206D8aA700cE2143D7db854D168c;

    address public constant TransmuterAddr = 0x45f81eF5F2ae78f49851f7A62e4061FF54Ff674B;
    address public constant AlchemistAddr = 0x6B566554378477490ab040f6F757171c967D03ab;
    address public constant AlchemistYVAAddr = 0xEBA649E0010818Aa4321088D34bD6162d65E7971;
    address public constant TransmuterYVAddr = 0x54dc35eb8c2E2E20f3657Af6F84cd9949C08CF38;

    IERC20 public alETHToken = IERC20(alETHAddr);
    IERC20 public WETHToken = IERC20(WETHAddr);
    IERC20 public yvWETHToken = IERC20(yvWETHAddr);

    constructor () {
        protocolName = "Alchemix";
        testedContracts = [alETHAddr];
    }
    
    function checkTestPasses() public view override returns (bool) {
        uint TransmuterVL = WETHToken.balanceOf(TransmuterAddr) / 1e18;
        uint AlchemistVL = WETHToken.balanceOf(AlchemistAddr) / 1e18;
        uint AlchemistYVAVL = yvWETHToken.balanceOf(AlchemistYVAAddr) / 1e18;
        uint TransmuterBYVAVL = yvWETHToken.balanceOf(TransmuterYVAddr) / 1e18;
        uint TotalValueLocked = TransmuterVL + AlchemistVL + AlchemistYVAVL + TransmuterBYVAVL;
        uint TotalSupply = alETHToken.totalSupply() / 1e18;
        return (TotalSupply <= TotalValueLocked);
    }
    function CheckTransmuterVL() public view returns (uint) {
        return WETHToken.balanceOf(TransmuterAddr) / 1e18;
    }
    function CheckAlchemistVL() public view returns (uint) {
        return WETHToken.balanceOf(AlchemistAddr) / 1e18;
    }
    function CheckAlchemistYVAVL() public view returns (uint) {
        return yvWETHToken.balanceOf(AlchemistYVAAddr) / 1e18;
    }
    function CheckTransmuterBYVAVL() public view returns (uint) {
        return yvWETHToken.balanceOf(TransmuterYVAddr) / 1e18;
    }
    function checkBalance() public view returns (uint) {
        uint TransmuterVL = WETHToken.balanceOf(TransmuterAddr) / 1e18;
        uint AlchemistVL = WETHToken.balanceOf(AlchemistAddr) / 1e18;
        uint AlchemistYVAVL = yvWETHToken.balanceOf(AlchemistYVAAddr) / 1e18;
        uint TransmuterBYVAVL = yvWETHToken.balanceOf(TransmuterYVAddr) / 1e18;
        return TransmuterVL + AlchemistVL + AlchemistYVAVL + TransmuterBYVAVL;
    }
    function checkCirculating() public view returns (uint) {
        return alETHToken.totalSupply() / 1e18;
    }
}