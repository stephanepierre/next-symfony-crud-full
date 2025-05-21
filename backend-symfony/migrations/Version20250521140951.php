<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250521140951 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE role DROP FOREIGN KEY FK_57698A6AD60322AC
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_57698A6AD60322AC ON role
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE role DROP role_id
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user ADD role_id INT NOT NULL, DROP roles
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user ADD CONSTRAINT FK_8D93D649D60322AC FOREIGN KEY (role_id) REFERENCES role (id)
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_8D93D649D60322AC ON user (role_id)
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE user DROP FOREIGN KEY FK_8D93D649D60322AC
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_8D93D649D60322AC ON user
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user ADD roles JSON NOT NULL, DROP role_id
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE role ADD role_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE role ADD CONSTRAINT FK_57698A6AD60322AC FOREIGN KEY (role_id) REFERENCES role (id) ON UPDATE NO ACTION ON DELETE NO ACTION
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_57698A6AD60322AC ON role (role_id)
        SQL);
    }
}
