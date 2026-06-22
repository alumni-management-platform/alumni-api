import { Injectable } from '@nestjs/common';

export type User = {
  id: number;
  email: string;
  password: string;
  role: 'SUPER_ADMIN' | 'ADMIN' | 'DATA_ADMIN' | 'ALUMNI';
};

@Injectable()
export class UsersService {
  private users: User[] = [
    {
      id: 1,
      email: 'admin@alumni.com',
      // plain password for now (DEV ONLY)
      password: 'secret123',
      role: 'SUPER_ADMIN',
    },
  ];

  findByEmail(email: string): User | undefined {
    return this.users.find((user) => user.email === email);
  }
}
