import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  checkHealth() {
    console.log('Health Check');
    return { status: 'ok', result: 'Health Check' };
  }
}
