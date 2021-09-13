# ixbrl-to-html

Convert your [iXBRL](https://www.xbrl.org/the-standard/what/ixbrl/) files into HTML files you can open in your browser.

## Prerequisite

* [Docker](https://www.docker.com/get-started)

## Build

```sh
$ docker build -t ixbrltohtml .
```

## Usage
At the moment, there are two ways to execute the tool, either through a shell script or using docker run.

### 1. Shell script
The shell script is a convenience wrapper to using docker run directly. It takes in fewer arguments.

```sh
./ixbrltohtml.sh -o OUTPUT_FILE INPUT_FILE
```

Note: 
This has only be tested on macOS Big Sur 11.5.2 but should work with any UNIX OS having a bash shell.

### 2. docker run
The tool can alternatively be executed using docker run command. This is the preferred usage in Windows systems which ,by default, doesn't have a bash shell.

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