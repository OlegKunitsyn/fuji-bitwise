       *>**
       *>  NetCOBOL library: bitwise
       *>
       *>  @author Olegs Kunicins
       *>  @license LGPL-2.1
       *>
       *>  This library is free software; you can redistribute it and/or
       *>  modify it under the terms of the GNU Lesser General Public
       *>  License as published by the Free Software Foundation; either
       *>  version 3.0 of the License, or (at your option) any later 
       *>  version.
       *>  
       *>  This library is distributed in the hope that it will be 
       *>  useful, but WITHOUT ANY WARRANTY; without even the implied 
       *>  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
       *>  PURPOSE.  See the GNU Lesser General Public License for more
       *>  details.
       *>  
       *>  You should have received a copy of the GNU Lesser General 
       *>  Public License along with this library.
       *>**

       *>*
       *> Convert one byte into hexadecimal representation.
       *> @param l-byte Byte
       *> @return 2 hexadecimal chars
       *>*
       identification division.
       program-id. byte-to-hex.
       data division.
       working-storage section.
       01 CHARS pic x(16) value "0123456789ABCDEF".
       01 ws-remainder pic 9(3).
       01 ws-quotient pic 9(3).
       01 ws-byte pic 9(3).
       linkage section.
       01 l-byte pic x.
       01 l-hex pic x(2).
       procedure division using l-byte, l-hex.
           compute ws-byte = function ord(l-byte) - 1.
           divide ws-byte by 16 giving ws-quotient remainder ws-remainder.
           add 1 to ws-remainder.
           add 1 to ws-quotient.
           move CHARS(ws-remainder:1) to l-hex(2:1).
           move CHARS(ws-quotient:1) to l-hex(1:1).
       end program byte-to-hex.

       *>*
       *> Convert one byte into hexadecimal representation.
       *> @param l-hex 2 hexadecimal chars
       *> @return Byte
       *>*
       identification division.
       program-id. hex-to-byte.
       data division.
       working-storage section.
       01 ws-remainder pic 9(3).
       01 ws-quotient pic 9(3).
       01 ws-byte pic 9(3) binary.
       linkage section.
       01 l-hex pic x(2).
       01 l-byte pic x.
       procedure division using l-hex, l-byte.
           compute ws-quotient = function ord(function upper-case(l-hex(1:1))) - 49.
           if ws-quotient > 16
               subtract 7 from ws-quotient
           end-if.
           compute ws-remainder = function ord(function upper-case(l-hex(2:1))) - 49.
           if ws-remainder > 16
               subtract 7 from ws-remainder
           end-if.
           compute ws-byte = ws-quotient * 16 + ws-remainder.
           move function char(ws-byte + 1) to l-byte.
       end program hex-to-byte.
