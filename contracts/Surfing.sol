// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Surfing {
    uint public videoCount = 0;
    string public name = "Surfing";

    mapping(uint => Video) public videos;

    struct Video {
        uint id;
        string hash;
        string name;
        address author;
    }

    event VideoUploaded(
        uint id,
        string hash,
        string title,
        address author
    );

    constructor() public {

    }

    function uploadVideo(string memory _videoHash, string memory _title) public {
        require(bytes(_videoHash).length > 0);
        require(bytes(_title).length > 0);
        require(msg.sender != address(0));

        // Increment video id
        videoCount ++;
        // Add video to the contract
        videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);
        // Trigger an event
        emit VideoUploaded(videoCount, _videoHash, _title, msg.sender);

    }
}