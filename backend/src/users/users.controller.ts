import { Controller, Get, Req, UseGuards } from '@nestjs/common';

import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { RolesGuard } from '../auth/roles.guard';
import { Roles } from '../auth/roles.decorator';

type AuthenticatedRequest = {
  user: {
    userId: number;
    email: string;
    role: string;
  };
};

@Controller('users')
export class UsersController {
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles('SUPER_ADMIN')
  @Get('me')
  getMe(@Req() req: AuthenticatedRequest) {
    return req.user;
  }
}
