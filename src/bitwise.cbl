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
       *> Convert hexadecimal to binary.
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

       *>*
       *> Convert one byte into binary representation.
       *> @param l-byte Byte
       *> @return 8 binary chars
       *>*
       identification division.
       program-id. byte-to-bin.
       data division.
       working-storage section.
       01 ws-remainder pic 9.
       01 ws-idx pic 9.
       01 ws-byte pic 9(3).
       linkage section.
       01 l-byte pic x.
       01 l-bits pic x(8).
       procedure division using l-byte, l-bits.
           compute ws-byte = function ord(l-byte) - 1.
           perform varying ws-idx from 1 by 1 until ws-idx > 8
             divide ws-byte by 2 giving ws-byte remainder ws-remainder
             move ws-remainder to l-bits(9 - ws-idx:1)
           end-perform.
       end program byte-to-bin.

       *>*
       *> Bitwise OR
       *> 
       *> @param l-arg-a One byte
       *> @param l-arg-b One byte
       *> @return One byte
       *>*
       identification division.
       program-id. bin-or.
       data division.
       working-storage section.
       01 ws-arg-a pic 9(3).
       01 ws-arg-b pic 9(3).
       01 ws-arg-a-rem pic 9.
       01 ws-arg-b-rem pic 9.
       01 ws-result-num pic 9(3) value 0.
       01 ws-result-rec.
         05 ws-result-bit pic 9 occurs 8 times indexed by idx.
       linkage section.
       01 l-arg-a pic x.
       01 l-arg-b pic x.
       01 l-result pic x.
       procedure division using l-arg-a, l-arg-b, l-result.
           compute ws-arg-a = function ord(l-arg-a) - 1.
           compute ws-arg-b = function ord(l-arg-b) - 1.
           initialize ws-result-num.
           *> calculate
           perform varying idx from 8 by -1 until idx = 0
             divide ws-arg-a by 2 giving ws-arg-a remainder ws-arg-a-rem
             divide ws-arg-b by 2 giving ws-arg-b remainder ws-arg-b-rem
             compute ws-result-bit(idx) = function min(1, ws-arg-a-rem + ws-arg-b-rem)
           end-perform.
           *> reverse
           perform varying idx from 1 by 1 until idx > 8
             compute ws-result-num = ws-result-num * 2 + ws-result-bit(idx)
           end-perform.
           move function char(ws-result-num + 1) to l-result.
       end program bin-or.

       *>*
       *> Bitwise AND
       *> 
       *> @param l-arg-a One byte
       *> @param l-arg-b One byte
       *> @return One byte
       *>*
       identification division.
       program-id. bin-and.
       data division.
       working-storage section.
       01 ws-arg-a pic 9(3).
       01 ws-arg-b pic 9(3).
       01 ws-arg-a-rem pic 9.
       01 ws-arg-b-rem pic 9.
       01 ws-result-num pic 9(3) value 0.
       01 ws-result-rec.
         05 ws-result-bit pic 9 occurs 8 times indexed by idx.
       linkage section.
       01 l-arg-a pic x.
       01 l-arg-b pic x.
       01 l-result pic x.
       procedure division using l-arg-a, l-arg-b, l-result.
           compute ws-arg-a = function ord(l-arg-a) - 1.
           compute ws-arg-b = function ord(l-arg-b) - 1.
           initialize ws-result-num.
           *> calculate
           perform varying idx from 8 by -1 until idx = 0
             divide ws-arg-a by 2 giving ws-arg-a remainder ws-arg-a-rem
             divide ws-arg-b by 2 giving ws-arg-b remainder ws-arg-b-rem
             compute ws-result-bit(idx) = ws-arg-a-rem * ws-arg-b-rem
           end-perform.
           *> reverse
           perform varying idx from 1 by 1 until idx > 8
             compute ws-result-num = ws-result-num * 2 + ws-result-bit(idx)
           end-perform.
           move function char(ws-result-num + 1) to l-result.
       end program bin-and.

       *>*
       *> Bitwise XOR
       *> 
       *> @param l-arg-a One byte
       *> @param l-arg-b One byte
       *> @return One byte
       *>*
       identification division.
       program-id. bin-xor.
       data division.
       working-storage section.
       01 ws-arg-a pic 9(3).
       01 ws-arg-b pic 9(3).
       01 ws-arg-a-rem pic 9.
       01 ws-arg-b-rem pic 9.
       01 ws-result-num pic 9(3) value 0.
       01 ws-result-rec.
         05 ws-result-bit pic 9 occurs 8 times indexed by idx.
       linkage section.
       01 l-arg-a pic x.
       01 l-arg-b pic x.
       01 l-result pic x.
       procedure division using l-arg-a, l-arg-b, l-result.
           compute ws-arg-a = function ord(l-arg-a) - 1.
           compute ws-arg-b = function ord(l-arg-b) - 1.
           initialize ws-result-num.
           *> calculate
           perform varying idx from 8 by -1 until idx = 0
             divide ws-arg-a by 2 giving ws-arg-a remainder ws-arg-a-rem
             divide ws-arg-b by 2 giving ws-arg-b remainder ws-arg-b-rem
             compute ws-result-bit(idx) = function mod(ws-arg-a-rem + ws-arg-b-rem, 2)
           end-perform.
           *> reverse
           perform varying idx from 1 by 1 until idx > 8
             compute ws-result-num = ws-result-num * 2 + ws-result-bit(idx)
           end-perform.
           move function char(ws-result-num + 1) to l-result.
       end program bin-xor.

       *>*
       *> Bitwise NOT
       *> 
       *> @param l-arg-a One byte
       *> @param l-arg-b One byte
       *> @return One byte
       *>*
       identification division.
       program-id. bin-not.
       data division.
       working-storage section.
       01 ws-arg pic 9(3).
       01 ws-arg-rem pic 9.
       01 ws-result-num pic 9(3) value 0.
       01 ws-result-rec.
         05 ws-result-bit pic 9 occurs 8 times indexed by idx.
       linkage section.
       01 l-arg pic x.
       01 l-result pic x.
       procedure division using l-arg, l-result.
           compute ws-arg = function ord(l-arg) - 1.
           initialize ws-result-num.
           *> calculate
           perform varying idx from 8 by -1 until idx = 0
             divide ws-arg by 2 giving ws-arg remainder ws-arg-rem
             compute ws-result-bit(idx) = function mod(ws-arg-rem + 1, 2)
           end-perform.
           *> reverse
           perform varying idx from 1 by 1 until idx > 8
             compute ws-result-num = ws-result-num * 2 + ws-result-bit(idx)
           end-perform.
           move function char(ws-result-num + 1) to l-result.
       end program bin-not.
