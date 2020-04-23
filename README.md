# Voli

A command line (in progress) tool to generate boilerplate code.

## Installation

in `pubspec.yaml`

```yaml
dev_dependencies:
    voli: ^1.0.0
```  

## Usage

```shell
flutter pub run voli -t <template_name> -p <full_path_to_templates_folder>
# flutter pub run voli -t tdd -p C:\Users\Source\Desktop\templates

```

## Adding your own templates

Consider making a folder directory for your `templates` folder like this

```shell
Folder PATH listing
/directory/of/templates/folder
+---tdd
|   |   template.yaml
|   |
|   \---files
|           main.dart
|
\---toast
        template.yaml

# find out how to make your own templates here https://github.com/meta-boy/VoliTemplates
```

## Disclaimer

```shell
for now this package is not ready for use but is actively developed, please do not install untill a stable relase is published
```
