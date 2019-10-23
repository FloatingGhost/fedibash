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

Or you can use `./fedi-but-cursed` with tmux installed to have a timeline-and-posting
window thing I guess

Post usage:
```bash
./post [options] message

options:
  -i/--image path_to_image
  -v/--visibility public|unlisted|private|direct
```  

you can use `-i` multiple times to upload multiple images, if you want to do that.
