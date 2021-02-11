# Fuji Bitwise
NetCOBOL library with bitwise functions

## Module Summary

| Name | Description |
| ----------- | ----------- | 
| [byte-to-hex](#byte-to-hex) | Convert one byte into hexadecimal representation. | 
| [hex-to-byte](#hex-to-byte) | Convert hexadecimal to binary. | 
| [byte-to-bin](#byte-to-bin) | Convert one byte into binary representation. | 
| [bin-or](#bin-or) | Bitwise OR | 
| [bin-and](#bin-and) | Bitwise AND | 
| [bin-xor](#bin-xor) | Bitwise XOR | 
| [bin-not](#bin-not) | Bitwise NOT | 

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

Convert hexadecimal to binary.


#### Parameters

> **l-hex** 2 hexadecimal chars 

#### Returns

> Byte


### byte-to-bin

*CALL "byte-to-bin" USING l-byte.*

Convert one byte into binary representation.


#### Parameters

> **l-byte** Byte 

#### Returns

> 8 binary chars


### bin-or

*CALL "bin-or" USING l-arg-a, l-arg-b.*

Bitwise OR



#### Parameters

> **l-arg-a** One byte 
> **l-arg-b** One byte 

#### Returns

> One byte


### bin-and

*CALL "bin-and" USING l-arg-a, l-arg-b.*

Bitwise AND



#### Parameters

> **l-arg-a** One byte 
> **l-arg-b** One byte 

#### Returns

> One byte


### bin-xor

*CALL "bin-xor" USING l-arg-a, l-arg-b.*

Bitwise XOR



#### Parameters

> **l-arg-a** One byte 
> **l-arg-b** One byte 

#### Returns

> One byte


### bin-not

*CALL "bin-not" USING l-arg-a, l-arg-b.*

Bitwise NOT



#### Parameters

> **l-arg-a** One byte 
> **l-arg-b** One byte 

#### Returns

> One byte

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
