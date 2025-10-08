import apiInstance from './apiInstance copy';
import realTimeInstance from './realTimeInstance';

export const getRealTimeHealthCheck = async () => {
  const response = await realTimeInstance.get('/health');
  return response.data;
}

export const getApiHealthCheck = async () => {
  const response = await apiInstance.get('/health');
  return response.data;
}