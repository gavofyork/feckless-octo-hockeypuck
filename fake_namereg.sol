contract Namereg {

    /// set an address of institution
    function set_address(bytes32 identifier, address institution) {
        toAddress[identifier] = institution;
    }

    /// return an address of institution
    function address(bytes32 identifier) constant returns (address institution) {
        return toAddress[identifier].institution;
    }

    mapping (bytes32 => address) toAddress;
}

