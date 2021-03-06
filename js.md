- Sort and count imports
```shell
find . -type f | grep -rhoP " from (.)*?;$" | sort | uniq -c | sort -nr | less
```

- Print dependencies and devDependencies
```shell
(function inspect(){ jq -M $1 package.json | sort; } && (inspect .dependencies && inspect .devDependencies) | sed -r "s/\: \"(.)+?$//g" | sed -r "s/\{|\}/ /" | sed -r "s/\"| //g" | uniq)
```

- Print specs of tests (assuming single quotes)
```shell
find . -type f | xargs grep -hE "it\('.+'|describe\('.+'" | sed -r "s/([a-zA-Z\.])+?it\('//; s/([a-zA-Z\.])+?describe\('/- /; s/'.+?$//"
```
