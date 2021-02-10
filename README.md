# Fuji Bitwise
NetCOBOL library with bitwise functions

## Module Summary

| Name | Description |
| ----------- | ----------- | 
| [byte-to-hex](#byte-to-hex) | Convert one byte into hexadecimal representation. | 
| [hex-to-byte](#hex-to-byte) | Convert one byte into hexadecimal representation. | 

## Module Details

### byte-to-hex

*CALL "byte-to-hex" USING l-byte.*

Convert one byte into hexadecimal representation.


#### Parameters

> **l-byte** Byte 

#### Returns

> 2 hexadecimal chars


### hex-to-byte

*CALL "hex-to-byte" USING l-hex.*

Convert one byte into hexadecimal representation.


#### Parameters

> **l-hex** 2 hexadecimal chars 

#### Returns

> Byte


# Usage
Install and initialize [COBOL Package Manager](https://cobolget.com):
```
$ npm install -g cobolget
$ cobolget init
```
Add the package to the `Manifest`:
```
$ cobolget add fuji-bitwise
$ cobolget update
```
Install the package and its dependencies:
```
$ cobolget install
....
Modules modules.cpy and modules.cbl updated.
```
Directory `modules` contains source-code of the package and `modules.cbl` ready for compliation and linking with your project.
