namespace my.application;


entity Users {
    key ID          : UUID;
        firstname   : String;
        lastname    : String;
        email       : String;
        birthdate   : Date;
		password    : String;
		role        : String enum {ROLE_USER; ROLE_ADMIN};
        pets        : Association to many Pets on pets.user = $self;
}

entity Pets {
    key ID          : UUID;
        petType     : String enum {CAT; DOG};
        name        : String;
        birthdate   : Date;
        user        : Association to Users;
        cat         : Composition of one Cats on cat.parent = $self;
        dog         : Composition of one Dogs on dog.parent = $self;
}

entity Cats {
        parent      : Association to Pets;
        bold        : Boolean;
}

entity Dogs {
        parent      : Association to Pets;
        guideDog    : Boolean;
}