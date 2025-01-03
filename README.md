# OrganizeFiles

Decluttering your file system doesn’t have to be a hassle anymore. Moving files into their appropriate folders can be tedious and time-consuming—especially when done manually.

The Organize Files gem for Ruby streamlines this process by automatically organizing files based on their extensions. Simply point it to a directory, and it will sort the files into their respective folders. If a folder for a specific file extension doesn't already exist, it will be created for you.

## Getting started

Install the gem
```bash
gem install organize_files
```

## Usage

Enter the directory you want to sort the files in.

```bash
organize_files [options] <directory>
```
- <directory> The directory you want to organize

Example:
```bash
organize_files '/path/to/downloads'
```

Output:
```bash
Successfully moved index2.pdf to /path/to/downloads/Documents/index2.pdf
```

Options:
- `-c`, `--config`, CONFIG_FILE: Specify the configuration file to use.

- If not provided, the script will look for `~/.organize_config.yml` in your home directory.
- If ~/.organize_config.yml is not found, it will use the built-in default configuration.
- `-h`, `--help`, Prints this help message.


## Configuration
You can customize how files are categorized by creating a YAML configuration file.

Default Configuration File:

The script will automatically look for a configuration file named ~/.organize_config.yml in your home directory.

Example ~/.organize_config.yml:

```YAML
images:
  - .jpg
  - .jpeg
  - .png
documents:
  - .pdf
  - .docx
  - .txt
audio:
  - .mp3
  - .wav
videos:
  - .mp4
  - .mov
archives:
  - .zip
  - .rar
programming:
  - .rb
  - .py
  - .js
```

### Requirements

This gem requires Ruby 3.0+.

## Contributing
Please see [CONTRIBUTING.md](CONTRIBUTING.md)
