# Objective

This demo repository was created in order to study the [Issue with substituted drive letters on Windows](https://github.com/vitest-dev/vitest/issues/7170#issuecomment-2607531580).

The issue is that if one creates a substituted drive letter for instance like this :

```
subst H: %USERPROFILE%
```
and one clones the repository under H:\, then runs
```
npm install
npm run test
```
from H:\vitest-playground
a runtime error will happen while executing the tests, vite complaining of a discrepancy between the resolved path of the .ts files and their actual location.
If you run `npm run dev` and access the web page, a similar error will be reported by the server.


## Creation of this repository
This repository was created from a template inside vite like below :
```
npm create vite@latest my-react-app --template react

Select a framework: > React
Select a variant: > TypeScript + SWC (was thinking also of React Router V7)
```
Then some code was added to add also vitest to the mix.

## solving the issue of substituted drive

editing vite.config.ts to add 
```
resolve {
    preserveSymlinks: true
}
```
inside the config as mentioned in https://github.com/vitejs/vite/issues/10802#issuecomment-2198099425 fixes the issue with substitued drives.

