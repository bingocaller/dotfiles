function sass-lint --wraps='sass --no-source-map $argv[1]:.sass-tmp; rm -rf .sass-tmp' --description 'Run sass and remove resulting files to see error reporting'
    sass --no-source-map $argv[1]:.sass-tmp
    rm -rf .sass-tmp
end
