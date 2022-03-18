pragma solidity ^0.8.12;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
contract Condos is ERC721 {
    uint32 public Id;
    mapping (address => uint32) public MDTrack;
    
    constructor() ERC721("Condos Token", "CONDO") IERC721Metadata() payable public {
        Id = 0;
    }
    
    mapping (uint256 => string) private _tokenURIs;
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual{
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    function createNFT(address receiver, string calldata metadata) external returns (uint32){
        Id++;
        _mint(receiver, Id);
        _setTokenURI(Id, metadata);
        MDTrack[receiver] = Id;
        return Id;
    }

    function transferNFT(address sender, address receiver, uint32 transId, string calldata metadata) external {
        transferFrom(sender, receiver, transId);
        _setTokenURI(transId, metadata);
        delete MDTrack[sender];
        MDTrack[receiver] = Id;
    }
}

    
    
