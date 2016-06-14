- Count and sort files for directories (excluding some like .git)
```shell
(CF() { for i; do find $i -type f -not -path "./.git/*" -not -path "./node_modules/*" | wc -l | xargs -I{} echo {} "$i" ; done; } && CF foo bar) | sort -nr
(for i in $(find . -maxdepth 1 -type d | sed "/^.$/d" | sed "s|./||"); do find $i -type f -not -path "./.git/*" -not -path "./node_modules/*" | wc -l | xargs -I{} echo {} "$i" ; done) | sort -nr # every directory in current directory
```

- Display file structure for two levels, ignoring some directories and only for .js files, not showing empty directories
```shell
tree -a -I ".git|node_modules" -P "*.js" --prune -L 2 .
```

- Find files where a string is present (case insensitive), only displaying the filepath
```shell
find . -type f | xargs grep -si FoO -l
```

- Count the lines of code for a file extension
```shell
find . -type f -name "*.ts" | xargs wc -l | sort | less # displaying all files
( find ./ -name '*.ts' -print0 | xargs -0 cat ) | wc -l # one number
(CL() { for i; do ( find $i -type f -print0 | xargs -0 cat ) | wc -l | xargs -I{} echo {} "$i"; done; } && CL foo bar) | sort -nr # all files summed
find . -name "*.sh" | xargs wc -l | sed "/ total/d" | sed "s|./||" | sed -r "s|[ ]+?([0-9]*?) (.*?)|\2 [\1]|" | sort -V # files followed of the numer of lines
(for i in $(find . -maxdepth 1 -type d | sed "/^.$/d" | sed "s|./||"); do ( find $i -type f -print0 | xargs -0 cat ) | wc -l | xargs -I{} echo {} "$i"; done; ) | sort -nr # every directory of current directory
```

- Display files content separatedly in less
```shell
find . -type f -maxdepth 1 -size +0 | xargs less
```

- See the file size distribution with a GUI
```shell
baobab .
```

- Display node dependencies and devDependencies
```shell
cat package.json |  jq .dependencies && cat package.json |  jq .devDependencies
```

- Display the words in files, sorted by frequency, excluding the ones with less letters than three, and excluding words from a custom list
```shell
find . -type f | xargs cat | fgrep -v -w -f ../custom/list.txt | tr -c '[:alpha:]' '[\n*]' | sed -r '/^.{,3}$/d' | sort | uniq -c | sort -nr | less
```

- Display the words in filenames by frequency (excluding extensions)
```shell
find . -type f | xargs -n1 basename | sed 's/\.[^.]*$//' | sed -r 's/_|-|\./ /g' | tr -c '[:alpha:]' '[\n*]' | sort | uniq -c | sort -nr | less
```

- Display sorted by frequency constructor-like words
```shell
find . -type f | grep -rhoP " [A-Z][a-z]([A-Za-z0-9])+" | fgrep -v -w -f ../custom/list.txt | sort | uniq -c | sort -nr | less
```

- Display current files in dir sorted
```shell
find . -maxdepth 1 -type f | sed "s/\.\///" | sort -V | less -N
```

- Remove lines from a file that are equal to lines from other file, maintaining the order of the remaining lines
```shell
grep -Fvxf <(cat OTHER_FILE.txt) FILE_WITH_LINES_TO_REMOVE.txt | less
```

- Display sizes from directories in the current directory, sorted
```shell
(ExSizeFirstLevelDirs() { du -h --max-depth=1 $1 | sed s_$1__ | sort -hr; } && ExSizeFirstLevelDirs PATH/TO/DIR)
```

- Display all extensions sorted by frequency
```shell
find . -type f | sed 's/.*\.//' | sed 's/.*\///' | sort | uniq -c | sort -nr | less -N
```

- Display TODO's that contain the format TODO(name), with the line number and the file:
```shell
find . -type f | xargs grep -nE "TODO\(.+\):" | less -N
```

- Remove ANSI colors from output:
```shell
COMMAND1 | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
```

- Display different lines between two files side by side (ignoring whitespaces):
```shell
diff -dyb FILE1 FILE2 --suppress-common-lines | less -N
```
