# fpgaConvNet HLS

This repository is part of the fpgaConvNet framework, designed to solve the complex mapping problem of Convolutional Neural Networks (CNN) onto Field Programmable Gate Array (FPGA) devices.
The HLS repository contains the hardware implementation of CNN building blocks, and performs the mapping automation of a CNN model description to hardware.

This branch contains my 2025 summer research work on migrating the fpgaConvNet HLS workflow from the legacy Vivado HLS flow to Vitis HLS. The main changes include a set of new Tcl scripts for creating HLS components, running C simulation, synthesis, co-simulation and design export using `vitis-run`, together with supporting changes to the Python generation flow and several HLS source files. The work was based on the original `AlexMontgomerie/fpgaconvnet-hls` repository and was developed and tested as part of the migration to a newer Vitis-based workflow.

## Setup

The following programs are required:

1. Vivado HLS (2019.1, 2019.2)
2. python (>=3.8)

Once these programs are installed, you can setup the project from pypi:

```
python -m pip install fpgaconvnet-hls
```

## Usage

You can see example usage in the `tests/networks` folder as well as in the [fpgaconvnet-tutorial](https://github.com/AlexMontgomerie/fpgaconvnet-tutorial) repository. Below is a quick example of how a configuration can be loaded and used to generate and test hardware.

```python
from fpgaconvnet.hls.generate.network import GenerateNetwork

# create instance of the network
gen_net = GenerateNetwork("model-name", "model-config.json", "model.onnx")

# generate hardware and create HLS project for partition 0
gen_net.create_partition_project(0)

# run HLS synthesis for partition 0
gen_net.generate_partition_hardware(0)
```

---

Please feel free to ask questions or post any issues!
