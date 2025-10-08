// src/types/shapes.ts

// 공통 속성을 위한 기본 타입
interface ShapeBase {
  id: string;
  x: number;
  y: number;
  rotation?: number;
}

// 각 도형별 고유 타입을 정의
export interface RectShape extends ShapeBase {
  type: 'rect';
  width: number;
  height: number;
  fill: string;
  stroke?: string; // 테두리 색상 (선택적)
  strokeWidth?: number; // 테두리 두께 (선택적)
  cornerRadius?: number;
}

export interface CircleShape extends ShapeBase {
  type: 'circle';
  radius: number;
  fill: string;
  stroke?: string; // 테두리 색상 (선택적)
  strokeWidth?: number; // 테두리 두께 (선택적)
}

export interface TextShape extends ShapeBase {
  type: 'text';
  text: string;
  fontSize: number;
  fill: string;
  width: number;
  padding?: number;
}

// 모든 도형 타입을 포함하는 Union 타입
export type Shape = RectShape | CircleShape | TextShape;
