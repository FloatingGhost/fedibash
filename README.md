### Requirements
`jq` is required.

For Debian-based systems:

```bash
sudo apt update && sudo apt install -y jq
```

### Usage

```bash
./configure
./login
./post i want to die
```

Post usage:
```bash
./post [options] message

options:
  -i/--image path_to_image
  -v/--visibility public|unlisted|private|direct
```  
