# Explorers

Set of some commands and guidelines for exploring new codebases. The principal points are:

- Rely in external tools that are actively mantained or well supported
- Titled by the action you want to achieve
- As specific as possible (e.g. commands templates)
- Maximise productivity
- Tools supported by linux systems

To install the used tools in Ubuntu: `sh install-ubuntu.sh`

- Count files excluding some directories
```shell
find . -type f -not -path "./.git/*" | wc -l
```

- File structure ignoring some directories and only for .js files, not showing empty directories
```shell
tree -a -I ".git|node_modules" -P "*.js" --prune .
```

- Find files where a string is present (case insensitive), only displaying the filepath
```shell
find . -type f | xargs grep -i FoO -l
```

- Count the lines of code for a file extension
```shell
find . -type f -name "*.ts" | xargs wc -l # displaying all files
( find ./ -name '*.ts' -print0 | xargs -0 cat ) | wc -l # one number
```

- See the file size distribution with a GUI
```shell
baobab .
```

- Display node dependencies and devDependencies
```shell
cat package.json |  jq .dependencies && cat package.json |  jq .devDependencies
```

- Get stats of a git repository (using git-extras)
```shell
git summary
git effort
git effort --above 100 foo/**/*
```

## License
MIT