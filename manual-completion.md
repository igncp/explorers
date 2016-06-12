- Replace all letters and hyphens in a file by an asterisk:
```shell
cat FILE | sed "s/[a-zA-Z_\-]/*/g" | vim -
```

- Replace all N of every M letters by an asterisk:
```shell
(R1O1() { cat $1 | sed -r "s/([a-zA-Z])/*/g" | vim -; } && R1O1 PATH/TO/FILE)
(R1O2() { cat $1 | sed -r "s/([a-zA-Z])([a-zA-Z])/\1*/g" | vim -; } && R1O2 PATH/TO/FILE)
(R1O3() { cat $1 | sed -r "s/([a-zA-Z])([a-zA-Z])([a-zA-Z])/\1\2*/g" | vim -; } && R1O3 PATH/TO/FILE)
(R1O4() { cat $1 | sed -r "s/([a-zA-Z])([a-zA-Z])([a-zA-Z])([a-zA-Z])/\1\2\3*/g" | vim -; } && R1O4 PATH/TO/FILE)
(R2O3() { cat $1 | sed -r "s/([a-zA-Z])([a-zA-Z])([a-zA-Z])/\1**/g" | vim -; } && R2O3 PATH/TO/FILE)
(R3O4() { cat $1 | sed -r "s/([a-zA-Z])([a-zA-Z])([a-zA-Z])([a-zA-Z])/\1***/g" | vim -; } && R3O4 PATH/TO/FILE)
```

- Replace all N of every M lines by an asterisk:
```shell
(R1O2L() { cat $1 | sed -r "1~2 s|([-_a-zA-Z\.])|*|g" | vim -; } && R1O2L PATH/TO/FILE)
```


- Remove all letters and hyphens in a file:
```shell
cat FILE | sed "s/[a-zA-Z_\-]//g" | vim -
```

- Remove all characters after a colon in each line:
```shell
cat FILE | sed -r "s/:(.)+?/: .../g" | vim -
```

- Remove the filename of paths, leaving the extension (in this case md):
```shell
cat FILE | sed -r "s/[-0-9a-zA-Z\._]*\.md/_.md/g" | vim -
```
