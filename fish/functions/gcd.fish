function gcd --wraps='git checkout develop' --wraps='git checkout develop && git pull' --description 'alias gcd git checkout develop'
  git checkout develop $argv; 
end
