function init_pyenv -d "Initialise pyenv. Stored as function to avoid doing it on shell initialisation."
    set -gx PYENV_ROOT "$HOME/.pyenv"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
end
