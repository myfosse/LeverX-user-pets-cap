using my.application as my from '../db/data-model';

service CatalogService {

    entity Pets as projection on my.Pets;

    entity Users as projection on my.Users;

    entity Cats as projection on my.Cats;

    entity Dogs as projection on my.Dogs;

    view VCats as select from Pets JOIN Cats on Cats.parent.ID=Pets.ID {
      Pets.ID, Pets.user.ID as user_ID, Pets.petType, Pets.name, Pets.birthdate, Cats.bold
    } where Pets.petType='CAT';

    view VDogs as select from Pets JOIN Dogs on Dogs.parent.ID=Pets.ID {
      Pets.ID, Pets.user.ID as user_ID, Pets.petType, Pets.name, Pets.birthdate, Dogs.guideDog
    } where Pets.petType='DOG';
}