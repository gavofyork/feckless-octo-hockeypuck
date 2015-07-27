import "owned";

contract Namereg is owned {
    event NewInsitution(bytes32 identifier, address owner);
    event InstitutionChanged(bytes32 identifier, address institution);

    struct Record {
        address owner;
        address institution;
        bytes32 identifier;
    }

    /// only the owner of institution record
    modifier only_institution(bytes32 identifier) {
        if (toRecord[identifier].owner == msg.sender) _
    }

    /// only owner of the namereg can create new institution
    function new_institution(bytes32 identifier, address owner) onlyowner {
        if (toRecord[identifier].owner == 0)      
            return;
        toRecord[identifier] = o;
        NewInsitution(identifier, o);
    }

    /// only institution owner can alter institution address
    function set_address(bytes32 identifier, address institution) only_institution(identifier) {
        toRecord[identifier].institution = institution;
        InstitutionChanged(identifier, institution);
    }

    /// return an address of institution
    function address(bytes32 identifier) constant returns (address institution) {
        return toRecord[identifier].institution;
    }

    mapping (bytes32 => Record) toRecord;
}

