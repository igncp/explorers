- Get stats of a git repository (using git-extras)
```shell
git summary
git effort
git effort --above 100 foo/**/*
```

- Find in what commit a file was removed
``` shell
git log --all -- path/to/file
```

- Show the diff of a commit with its parent
```shell
git show COMMITSHA
```