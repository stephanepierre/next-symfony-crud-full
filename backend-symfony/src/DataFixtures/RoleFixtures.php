<?php

namespace App\DataFixtures;

use App\Entity\Role;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class RoleFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $roles = [
            ['ROLE_ADMIN', 'Administrateur'],
            ['ROLE_PREMIUM', 'Compte Premium'],
            ['ROLE_STANDARD', 'Compte Standard'],
            ['ROLE_FREE', 'Compte Gratuit'],
        ];

        foreach ($roles as [$name, $label]) {
            $role = new Role();
            $role->setName($name);
            $role->setLabel($label);
            $manager->persist($role);
        }

        $manager->flush();
    }
}
