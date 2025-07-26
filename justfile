default:
    @just --choose

install:
  yarn install

build:
  yarn vite build

run:
  yarn vite dev --open
