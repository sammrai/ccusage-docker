# ccusage-runner

A Docker wrapper for [`ccusage`](https://www.google.com/search?q=%5Bhttps://www.npmjs.com/package/ccusage%5D\(https://www.npmjs.com/package/ccusage\)), a command-line tool for visualizing token usage from Claude (Anthropic). This project provides a ready-to-use Docker image: `sammrai/ccusage-docker:latest`.


## Prerequisites

To use this Docker image, you need:

  - **Docker** installed on your machine.
  - **Claude configuration files** on your host machine. The Docker container expects these files to be mounted from your home directory:
      - `~/.claude.json`
      - `~/.claude/projects/`


## Usage

You can run `ccusage` commands directly using the Docker image.

### teractive Reporting

To run a token usage report interactively, use the following command to mount your configuration files and run the `ccusage` command:

```bash
docker run -it --rm \
  -v $HOME/.claude.json:/root/.claude.json \
  -v $HOME/.claude/projects:/root/.claude/projects \
  sammrai/ccusage-docker:latest ccusage
```


### Recommended: Shell Alias

To make running commands easier and more convenient, it's highly recommended to set up a shell alias. This allows you to use `ccusage` as if it were a native command on your system.

**For `bash` users:**

Add the following line to your `~/.bashrc` file:

```bash
echo "alias ccusage='docker run -it --rm -v \$HOME/.claude.json:/root/.claude.json -v \$HOME/.claude/projects:/root/.claude/projects sammrai/ccusage-docker:latest ccusage'" >> ~/.bashrc
```

Then, apply the changes by running:

```bash
source ~/.bashrc
```

Once the alias is set, you can simply run any `ccusage` command directly:

```bash
ccusage blocks --live
```

```bash
ccusage summary
```


### References

  - [ccusage on GitHub](https://github.com/ryoppippi/ccusage)
