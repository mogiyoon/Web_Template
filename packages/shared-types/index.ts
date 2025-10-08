// packages/shared-types/index.ts

export interface User {
    id: string;
    username: string;
    email: string;
}

export interface DocumentLayer {
    id: string;
    name: string;
    content: any; // 실제 콘텐츠 타입으로 변경 예정
}
