# About DVPL CONVERTER JS

`.dvpl` is a new file format that is used in the World of Tanks Blitz Client for all known clients, except files that are integreted within Android `.apk` packages & IOS internal /data/ .

This converter focuses on the ease of the ability to directly convert between .dvpl and base non-dvpl files in any directory.


## Set up environment for converter -

- For Windows, install Node.js for your environment (https://nodejs.org/en/), download the Recommended version,
  For Linux, You can install Node.js by simple Terminal Command, type 'sudo apt install nodejs npm' for Debian Based OS or 'sudo pacman -S nodejs npm' for Arch Based OS,
- Setup environment for Node-gyp (https://github.com/nodejs/node-gyp) scroll down to "Installation"
    - Requirements Windows [ Visual Studio 2019 Community With C++ Workload or Visual Studio Build Tools With C++ Workload ], Linux [ C++ Build Tools ].
    - for Windows/Linux you should only need to do a simple command `npm install -g node-gyp` (might not be needed to install separately as gyp comes bundled with npm now),
    - read the readme in that repo for what you'll need, and install them before proceeding.
- Git Clone this repo / Download this entire repo to your device.
- Enter the directory where package.json sits with command line, and install with the following commands **IN ORDER**:
    - `npm install` and then `npm install -g` as administrator privilages. ( Windows ) ///
    - `npm install` and then `npm install -g` if you are not root add "sudo" at the beginning of the command. ( Linux ) ///
- Now you can execute this CLI converter anywhere with `dvpl` in commandline with the following flags `compress` / `decompress` or `c` / `d` for more info use the flag `help` ///

### Example of Usage -
```
CMD C:\[NAME]> dvpl decompress
File C:\[NAME]/[NAME]/[NAME].yaml.dvpl has been successfully decompressed into [NAME].yaml
File C:\[NAME]/[NAME]/[NAME].yaml.dvpl has been successfully decompressed into [NAME].yaml
File C:\[NAME]/[NAME]/[NAME].xml.dvpl has been successfully decompressed into [NAME].xml
.
.
.
.
DECOMPRESSION FINISHED. DECOMPRESSED 3 files.
``

## DVPL Code Specifications -

- Starts with stream of Byte data, can be compressed or uncompressed.
- The last 20 bytes in DVPL files are in the following format:
    - UINT32LE input size in Byte
    - UINT32LE compressed block size in Byte
    - UINT32LE compressed block crc32
    - UINT32LE compression Type
        - 0: no compression (format used in all uncompressed `.dvpl` files from SmartDLC)
        - 1: LZ4 (not observed but handled by this decompressor)
        - 2: LZ4_HC (format used in all compressed `.dvpl` files from SmartDLC)
        - 3: RFC1951 (not implemented in this decompressor since it's not observed)    
    - 32-bit Magic Number represents "DVPL" literals in utf8 encoding, encoded in big-Endian.        

## Libraries Used -

- `lz4` is a port of the LZ4 compression algorithm (https://github.com/pierrec/node-lz4)
- `crc32` for crc32 calculation included in footer for DVPL.
