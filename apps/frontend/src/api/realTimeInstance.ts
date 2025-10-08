import axios, { AxiosError } from 'axios';

const realTimeInstance = axios.create({
  baseURL: 'http://localhost:3000/real-time',
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 10000,
})

realTimeInstance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('access_token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    console.error('요청 에러:', error);
    return Promise.reject(error);
  }
);

realTimeInstance.interceptors.response.use(
  (response) => response,
  (error: AxiosError) => {
    if (error.response) {
      const status = error.response.status;

      if (status === 401) {
        console.warn('인증 만료 - 로그아웃 처리 필요');
      } else if (status >= 500) {
        console.error('서버 오류:', error.response.data);
      }
    } else {
      console.error('네트워크 오류 또는 서버 연결 실패');
    }
    return Promise.reject(error);
  }
);

export default realTimeInstance;