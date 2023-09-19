// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Blog {
    string public name;
    address public owner;

    using Counters for Counters.Counter;
    Counters.Counter private _postIds;

    struct Post {
        uint id;
        string title;
        string content;
        bool published;
    }
    /* here we create lookups for posts by id and posts by ipfs hash */
    mapping(uint => Post) private idToPost;
    mapping(string => Post) private hashToPost;

    event PostCreated(uint id, string title, string hash);
    event PostUpdated(uint id, string title, string hash, bool published);

    constructor(string memory _name) {
        console.log("Deploying Blog with name:", _name);
        name = _name;
        owner = msg.sender;
    }

    //update blog name
    function updateName(string memory _name) public {
        name = _name;
    }

    //transfering ownership
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    //fetching post using hash
    function fetchPost(string memory hash) public view returns (Post memory) {
        return hashToPost[hash];
    }

    //create a post
    function createPost(
        string memory title,
        string memory hash
    ) public onlyOwner {
        _postIds.increment();
        uint postId = _postIds.current();
        Post storage post = idToPost[postId];
        post.id = postId;
        post.title = title;
        post.content = hash;
        post.published = true;
        hashToPost[hash] = post;
        emit PostCreated(postId, title, hash);
    }

    //update existing post
    function updatePost(
        uint postId,
        string memory title,
        string memory hash,
        bool published
    ) public onlyOwner {
        Post storage post = idToPost[postId];
        post.title = title;
        post.published = published;
        post.content = hash;
        idToPost[postId] = post;
        hashToPost[hash] = post;
        emit PostUpdated(post.id, title, hash, published);
    }

    //fetch all posts
    function fetchPosts() public view returns (Post[] memory) {
        uint itemsCount = _postIds.current();

        Post[] memory posts = new Post[](itemsCount);
        for (uint i = 0; i < itemsCount; i++) {
            uint currentId = i + 1;
            Post storage currentItem = idToPost[currentId];
            posts[i] = currentItem;
        }
        return posts;
    }

    // only owner can modify
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
