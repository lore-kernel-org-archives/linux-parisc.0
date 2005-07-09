From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 09 Jul 2005 15:42:51 +0000
Message-ID: <42CFF07B.4000402@tiscali.be>
References: <42B91C1400005075@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42B91C1400005075@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I know it's just a w-a but I also test 2.6.12.2-pa2 on the b180 and it also survive to my stress test for more then a day:
# cat /proc/cpuinfo ; uname -a ; echo " "; uptime
processor       : 0
cpu family      : PA-RISC 1.1e
cpu             : PA7300LC (PCX-L2)
cpu MHz         : 180.000000
model           : 9000/778/B180L
model name      : Merlin L2+ 180 (9000/778/B180L)
hversion        : 0x00005040
sversion        : 0x00000481
I-cache         : 64 KB
D-cache         : 64 KB (WB, 0-way associative)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.60
software id     : 2010134099

Linux patst004 2.6.12.2-pa2-b180 #2 Fri Jul 8 12:15:14 CEST 2005 parisc GNU/Linux

  17:00:15 up 1 day,  4:31,  4 users,  load average: 8.86, 8.69, 8.88

Still have to find why it help a bit (for relatively high I/O)?

Why this g++ test (4.1 and not debian 4.0) make hanging the kernel?

Joel

Joel Soete wrote:
>>>Ok I boot the same and grab recent gcc-4.1 src (about 6h gmt) and build
>>
>>it
>>
>>>with build-tls-tools with following options:
>>>--enable-shared --with-system-zlib --disable-nls --enable-debug --host=hppa-linux
>>>--tar
>>>get=hppa-linux --disable-libmudflap --enable-languages=c,c++
>>
>>Don't use 4.1 
> 
> 
> Ok but that was just  to reproduce the pb you encountered :-)
> 
> 
>>unless you want to help with fixing GCC bugs!
>>
> 
> I would so like but I am just able to drive some test as accurately as possible.
> 
> 
[...]
>>The range above disables gcc's use of the floating-point no clobber
>>registers.
> 
btw which fpr do you called 'no clobber'?

I am a bit confused by those other comment in our entry.S:
...
          /* Floating point registers (FIXME: what do we do with these?)

             %fr0  - %fr3    status/exception, not preserved
             %fr4  - %fr7    arguments
             %fr8  - %fr11   not preserved by C code
             %fr12 - %fr21   preserved by C code
             %fr22 - %fr31   not preserved by C code
           */
...

and according to your answer <http://lists.parisc-linux.org/pipermail/parisc-linux/2005-April/026256.html>
fr12 - fr21 (the preserved by C code) would remain unchanged across a call?

Thanks again,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
