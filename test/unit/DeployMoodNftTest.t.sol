// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }
    //エラー未解決,tokenURIとimageURIの違いかも？
    function testConvertSvgToUri() public view {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4KICA8dGV4dCB4PSIyMDAiIHk9IjI1MCIgZmlsbD0iYmxhY2siPgogICAgSGkhIFlvdSBkZWNvZGVkIHRoaXMhCiAgPC90ZXh0Pgo8L3N2Zz4KCg==";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="200" y="250" fill="black">Hi! You decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assertEq(keccak256(abi.encodePacked(expectedUri)), keccak256(abi.encodePacked(actualUri)));
    }

}