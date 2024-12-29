# OrganizeFiles

Decluttering your file system doesn’t have to be a hassle anymore. Moving files into their appropriate folders can be tedious and time-consuming—especially when done manually.

The Organize Files gem for Ruby streamlines this process by automatically organizing files based on their extensions. Simply point it to a directory, and it will sort the files into their respective folders. If a folder for a specific file extension doesn't already exist, it will be created for you.

## Getting started

1. Install the gem
```
gem install organize_files
```

2. Enter the directory you want to sort the files in.
```
`organize_files '/path/to/file'`
```

Example:
```
organize_files '/path/to/downloads'
```
Output:
```
Successfully moved index2.pdf to /path/to/downloads/Documents/index2.pdf
```

### Requirements

This gem requires Ruby 3.0+.

## Contributing
Please see [CONTRIBUTING.md](CONTRIBUTING.md)