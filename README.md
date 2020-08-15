# latex-docker

Dockerfiles for LaTeX Environment

This repository provides the means to generaet Docker containers for compiling `LaTeX` documents. This can be used to simplify the `LaTeX` development process - ensuring a consistent environment. Instructions below can be used to set up the containers with relative ease.


### **Instructions**:

The user can either pull the Docker images from the Docker repository:

```bash
docker pull danielkelshaw/latex:<tag>
```

Or the user can use the `Makefile` to build the Docker container themselves locally:

```bash
make full
```

### **Compiling Tex:**

First you will want to add `cmdlatex` to your path:

```bash
echo "export PATH=\$PATH:$(pwd)" >> ~/.zshrc
```

Now you can use `cmdlatex` to build your `.tex` files:

```bash
cmdlatex <latex_command>
```

For example:

```bash
cmdlatex pdflatex main.tex
```

This will generate all of the usual files in the current working directory.

### **Note:**

The current version of `texlive` is verified with the `texlive.asc` - this is currently supported for the 2020 version but will need to be updated in the future as different versions of the software are signed. This is checked within the `setup.sh` script which is used to generate the container.

###### Made by Daniel Kelshaw

