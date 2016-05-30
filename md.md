Display the sections (##) titles numbered:
```shell
cat FILE.md | awk  "/## /" | sed -r "s/#+ //g" | nl | sed -r "s/^    //" | sed -r "s/\t/  /"
```