import React from 'react';

type FooListProps = {
  foos?: {
    id: number;
    name: string;
    description: string;
  }[];
};

export default function FooList({ foos }: FooListProps) {
  return null;
}

export const layout = {
  areaId: 'content',
  sortOrder: 30
};

export const query = `
  query Query {
    foos {
      id
      name
      description
    }
  }
`;
