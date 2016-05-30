- Count files excluding some directories
```shell
find . -type f -not -path "./.git/*" | wc -l
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

- Display only directoriesfrom the current directories sizes, sorted
```shell
(ExSizeFirstLevelDirs() { du -h --max-depth=1 $1 | sed s_$1__ | sort -hr; } && ExSizeFirstLevelDirs PATH/TO/DIR)
```

- Display all extensions sorted by frequency
```shell
find . -type f | sed 's/.*\.//' | sed 's/.*\///' | sort | uniq -c | sort -nr | less
```