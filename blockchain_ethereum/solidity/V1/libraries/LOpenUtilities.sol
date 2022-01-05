//"SPDX-License-Identifier: APACHE 2.0"

pragma solidity >=0.8.0 <0.9.0;


library LOpenUtilities {




    function isContained(address a, address [] memory b ) pure internal returns (bool) {
        for(uint256 x = 0; x < b.length; x++){
            if(a == b[x]) {
                return true; 
            }
        }
        return false; 
    }

    function isContained(uint256 z, uint256 [] memory y) pure internal returns (bool) {
        
        for(uint x = 0 ; x < y.length; x++){
            if(y[x] == z){
                return true; 
            }
        }
        return false; 
    }

    function isContained(string memory a, string [] memory b ) pure internal returns (bool) {
        for(uint256 x = 0; x < b.length; x++){
            if(isEqual(a, b[x])) {
                return true; 
            }
        }
        return false; 
    }
    
    function append(string memory a, string memory b) pure internal returns (string memory) {
        return string(abi.encodePacked(a, b));
    }

    function remove(string memory a, string [] memory b) pure internal returns (string [] memory){
        string [] memory c = new string[](b.length-1);
        uint256 y = 0; 
        for(uint256 x = 0; x < b.length; x++) {
            string memory d = b[x];
            if(!isEqual(a, d)){
                c[y] = d; 
                y++;
            }
        }
        return c; 
    }

    function append(string [] memory a, string[] memory b) pure internal returns (string [] memory) {
        uint256 total = a.length + b.length; 
        string [] memory c = new string[](total); 
        uint256 y = 0; 
        uint256 z = 0; 
        for(uint256 x = 0; x < total; x++) {
            if(x < a.length) {
                c[x] = a[y];
                y++;
            }
            else { 
                c[x] = b[z];
                z++;
            }
        }
        return c; 
    }


    function isEqual(string memory a, string memory b) pure internal returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b)))); 
    }


}