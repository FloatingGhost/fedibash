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
  -r/--reply post_id :: Reply to a specific post
  -i/--image path_to_image :: attach an image
  -v/--visibility public|unlisted|private|direct :: set visibility
```  

you can use `-i` multiple times to upload multiple images, if you want to do that.
