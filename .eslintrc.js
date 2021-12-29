module.exports = {
  parser: 'babel-eslint',
  extends: [
    'eslint:recommended',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:jsx-a11y/recommended',
    'plugin:react/recommended',
    'airbnb'
  ],
  env: {
    amd: true,
    browser: true,
    es6: true,
    jquery: true,
    node: true
  },
  parserOptions: {
    ecmaVersion: 8,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
      modules: true
    }
  },
  rules: {
    'arrow-parens': [
      1,
      'always'
    ],
    'arrow-body-style': [
      2,
      'as-needed'
    ],
    indent: [
      2,
      2,
      {
        SwitchCase: 1
      }
    ],
    'max-len': 0,
    'no-console': 1,
    'no-param-reassign': [
      2,
      {
        props: false
      }
    ],
    'object-curly-spacing': [
      2,
      'always'
    ],
    'prefer-template': 2,
    'require-jsdoc': 0,
    'react/jsx-filename-extension': [2, { extensions: ['.js', '.jsx'] }],
    'react/forbid-prop-types': 0
  }
}
