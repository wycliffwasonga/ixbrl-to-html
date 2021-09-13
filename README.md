# ixbrl-to-html

## Build

```sh
$ docker build -t ixbrltohtml .
```

## Usage

```sh
$ docker run --rm \
    --mount type=bind,src=INPUT_FILE,dst=/in \
    --mount type=bind,src=OUTPUT_FILE,dst=/out \
    ixbrltohtml \
    --out /out/OUTPUT_FILE_ARG \
    /in/INPUT_FILE_ARG
```

Before running the command make the following replacements
* **INPUT_FILE** with the absolute path to your iXBRL file
* **OUTPUT_FILE** with the absolute path to the file to output eg. */path/to/file_xbrlview.html*
* **INPUT_FILE_ARG**
* **OUTPUT_FILE_ARG**