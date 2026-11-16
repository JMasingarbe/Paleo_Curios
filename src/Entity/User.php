<?php

namespace App\Entity;

use \DateTimeImmutable;

class User
{
    private ?int $id = null;
    private string $email;
    private string $pwd;
    private \DateTimeImmutable $created_at;
    private array $roles = []; // Array of all User's Role

    public function __construct(
        string $email,
        string $pwd,
        \DateTimeImmutable $created_at
    )
    {
        $this->email = $email;
        $this->pwd = $pwd;
        $this->created_at = $created_at;
    }

    // Get functions

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getPwd(): string
    {
        return $this->pwd;
    }

    public function getCreatedAt(): \DateTimeImmutable
    {
        return $this->created_at;
    }

    public function getRoles(): array
    {
        return $this->roles;
    }

    // Set functions

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    public function setPwd(string $pwd): void
    {
        $this->pwd = $pwd;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): void
    {
        $this->created_at = $created_at;
    }

    public function addRole(Role $role): void
    {
        $this->roles[] = $role;
    }

    // Methods

    public static function hydrate(array $data): User
    {
        $user = new User($data["user_email"], $data["user_pwd"], new \DateTimeImmutable($data["user_created_at"]));

        $user->setId($data["id_user"] ?? null);

        foreach ($data["roles"] ?? [] as $role) {
            $user->addRole(Role::hydrate($role));
        }

        return $user;
    }
}