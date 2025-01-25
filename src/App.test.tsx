import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders Click on the Vite and React logos to learn more link', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/Click on the Vite and React logos to learn more/i);
  expect(linkElement).toBeInTheDocument();
});

