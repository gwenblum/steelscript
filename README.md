# Riverbed SteelScript

Riverbed SteelScript is a collection of libraries and scripts written in Python for interacting
with Riverbed solutions and appliances, and other network infrastructure devices.

## Quick Start

Here are 3 things you can do to start quick and easy with SteelScript.

<details>
  <summary>Use examples just with git and Docker</summary>

If you have git and Docker installed.
Open your shell (bash or PowerShell), build SteelScript from the latest source code and run it locally in a Docker container as follows:

### Build and run SteelScript in a container

Build a docker image:

```shell
# Build a docker image from latest code
docker build --tag steelscript:latest https://github.com/riverbed/steelscript
```

Run SteelScript in a container:

```shell
# Run the image in an interactive container
docker run -it steelscript:latest /bin/bash
```

### Try examples

You can try some script examples.


1. **AppResponse example**, print the Host Groups:

```shell
python examples/steelscript-appresponse/print_hostgroups-formatted.py {appresponse fqdn or IP address} -u {admin account} -p {password}
```

2. **Client Accelerator Controller example**, get the licenses and services:

```shell
python examples/steelscript-cacontroller/cacontroller-rest_api.py {client accelerator controller fqdn or IP address} --access_code {access_code}
```

3. **NetIM example**, list the devices:

```shell   
python examples/steelscript-netim/print-netim-devices-raw.py {netim core fqdn or IP address} --username {account} --password {password}
```

</details>

<details>
  <summary>Use SteelScript notebooks, just with git and Docker</summary>

If you have git and Docker installed.
You can build a steelscript container image that includes the Jupyter server and allows to run notebooks.

Build both steelscript bash imags and notebook image:

```shell
# Build the steelscript base image
docker build --tag steelscript:latest https://github.com/riverbed/steelscript

# Build the steelscript image for Jupyter Notebook
docker build --tag steelscript.notebook -f Dockerfile.notebook https://github.com/riverbed/steelscript
```

Run the container the steelscript.notebook image that contains the Jupyter Notebook server, listening on port 8888 by default.

```shell
# Start the steelscript.notebook container with built-in Jupyter Notebook
docker run --init --rm -p 8888:8888 --name=steelscript.notebook steelscript.notebook
```

In the output, grab the url containing the *token*, for example *http://127.0.0.1:8888/tree?token=123456* , and open it in your browser to log into the Jupyter web-console.

From there, in the *Notebooks* folder you can find some notebook  based on SteelScript.

</details>

<details>
  <summary>Install in your Python environment</summary>


If you have git, Python and pip installed.
Open your shell (bash or PowerShell), install the SteelScript modules directly from the latest source code:

```shell
# Install SteelScript and modules
pip install https://github.com/riverbed/steelscript
pip install https://github.com/riverbed/steelscript-appresponse
pip install https://github.com/riverbed/steelscript-netprofiler
pip install https://github.com/riverbed/steelscript-netim
# .... and others check the list on https://github.com/riverbed/steelscript
```

</details>


## Guide

> [!NOTE]
> The guide needs a good refresh. The source is there [https://github.com/riverbed/steelscript/docs](https://github.com/riverbed/steelscript/docs)

[Link to the SteelScript guide](https://support.riverbed.com/apis/steelscript)

## Distribution

SteelScript and modules are distributed via [Riverbed in GitHub](https://github.com/riverbed). The main repository is [SteelScript](https://github.com/riverbed/steelscript).

The recommendation is to use SteelScript latest version  available in Github, wether building your own container or installing python modules in your own environment, directly from the source code. See the quickstarts above. 

> [!NOTE]
> The docs requires provides details about other installation methods but requires refresh.

##  Contribute

Feel free to use, enhance and contribute by creating issues, sending pull requests (PR), extending with new modules ...

> [!NOTE]
> Contributions for alternative distribution methods and packaging (like pypi, rpm, .deb, rpm, tgz,...) can be organized inside /packaging and /test subfolders.

## About SteelScript

### The Framework

The common module for SteelScript is in the [SteelScript repository](https://github.com/riverbed/steelscript)
It contains common code but also it is the entrypoint for Documentation, Build, Test and releases.

Other SteelScript modules have their own repository which
can be found in the [Riverbed GitHub org](https://github.com/riverbed), the name is prefixed by "steelscript".

#### Modules for Riverbed products and appliances:

- [AppResponse](https://github.com/riverbed/steelscript-appresponse)
- [NetIM](https://github.com/riverbed/steelscript-netim)
- [NetProfiler](https://github.com/riverbed/steelscript-netprofiler)
- [SteelHead](https://github.com/riverbed/steelscript-steelhead)
- [SteelHead Controller](https://github.com/riverbed/steelscript-scc), also called SCC
- [Client Accelerator Controller (CAC)](https://github.com/riverbed/steelscript-client-accelerator-controller), formerly called SteelHead Mobile controller, SMC or SCCM

#### Extra modules

- [Wireshark](https://github.com/riverbed/steelscript-wireshark)
- [NetShark](https://github.com/riverbed/steelscript-netshark)
- [Packets](https://github.com/riverbed/steelscript-packets)
- [Command line Access](https://github.com/riverbed/steelscript-cmdline)

#### Other repos for components and SteelScript extensions:

> [!NOTE]
> The following have known issues and maintenance is pending

- *pending mantenance* [Application Framework](https://github.com/riverbed/steelscript-appfwk)
- *pending mantenance* [Business hour reporting plugin for Application Framework](https://github.com/riverbed/steelscript-appfwk-business-hours)
- *pending mantenance* [Stock report demo with Application Framework](https://github.com/riverbed/steelscript-appfwk-business-hours)
- *pending mantenance* [VM Config](https://github.com/riverbed/steelscript-vm-config)

### Folder Structure for Modules

SteelScript is based on Python 3.
The repos of SteelScript modules have a common structure 

```
   steelscript-module-name        # for example: steelscript-appresponse
   ├── README.md or README.rst    # Markdown is preferred (.md) and reStructuredText (.rst) is ok
   ├── LICENSE
   ├── CHANGELOG
   ├── .gitignore
   ├── docs
   ├── steelscript
   │   ├── __init__.py
   │   └── module-name            # for example: appresponse
   │       ├── core
   │       │   └── __init__.py
   │       ├── commands
   │       │   └── __init__.py
   │       └── __init__.py
   ├── tests
   ├── setup.py
   ├── notebooks
   └── tox.ini
```

Mandatory:

- README.rst: simple description using reStructured Text (rst) file format
- LICENSE: Riverbed Technology copyright, terms and conditions based on MIT
- CHANGELOG: Simple text file tracking major changes
- /docs: Documentation using reStructured Text (rst) file format.
- /: Python scripts samples showing how to use the module.
- /steelscript: The actual code, written in Python. Must be Python3 only.
- /tests: Test plans and unit test. Can be organized in subfolders. Test plan are ideally documented and easy to run scripts but can be anything defining a test plan (script, text, ...), for example a python script based on pytest.
- setup.py: Python setup file containing meta descriptions and requirements. Based on setuptools, distutils and pytest. Should NOT contain unit test (use Tox and put unit test inside /tests folder instead)


Optional:

- /tox.ini: standardized python testing definition based on [Tox](https://tox.readthedocs.io/en/latest)
- /notebooks: Notebooks based on [Jupyter](https://jupyter.org)

### Build

Builds are defined in the `SteelScript repo <https://github.com/riverbed/steelscript>`__ 

#### Prebuild test-plans validations

Execute test-plans with tox

```shell
  pip install tox
  tox
```  
 
#### Building Docker containers

Some Dockerfile are provided to build different flavors of the SteelScript container image:

- Dockerfile: standard build
- Dockerfile.slim: optimized build
- Dockerfile.notebook: build for demo and learning with Notebooks
- Dockerfile.dev: build development and testing container from master or fork/branch


<details>
  <summary>Build snippets</summary>

##### Standard:

```shell
  docker build --tag steelscript -f Dockerfile .
```  

##### Slim:

```shell
  docker build --tag steelscript.slim -f Dockerfile.slim .
```  

##### Notebook

```shell
  docker build --tag steelscript.notebook -f Dockerfile.notebook .
```

</details>

<details>
  <summary>Dev snippets</summary>

##### Dev from master

```shell
  git clone https://github.com/riverbed/steelscript --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-netprofiler --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-wireshark --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-cmdline --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-scc --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-appresponse --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-netim --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-client-accelerator-controller --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-steelhead --depth 1 --recurse-submodules
  git clone https://github.com/riverbed/steelscript-packets.git --depth 1 --recurse-submodules

  docker build --tag steelscript.dev --progress=plain -f steelscript/Dockerfile.dev .
```

##### Dev from your_fork/your_branch

```shell
  git clone https://github.com/your_fork/steelscript --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-netprofiler --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-wireshark --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-cmdline --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-scc --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-appresponse --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-netim --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-client-accelerator-controller --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-steelhead --depth 1 --recurse-submodules -b your_branch
  git clone https://github.com/your_fork/steelscript-packets.git --depth 1 --recurse-submodules -b your_branch

  docker build --tag steelscript.dev --progress=plain -f steelscript/Dockerfile.dev .
```  

</details>

## License

Copyright (c) 2021-2024 Riverbed Technology, Inc.

SteelScript is licensed under the terms and conditions of the MIT License
accompanying the software ("License").  SteelScript is distributed "AS
IS" as set forth in the License. SteelScript also includes certain third
party code.  All such third party code is also distributed "AS IS" and is
licensed by the respective copyright holders under the applicable terms and
conditions (including, without limitation, warranty and liability disclaimers)
identified in the license notices accompanying the software.
