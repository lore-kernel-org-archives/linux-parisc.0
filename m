From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] new toolchain (binutils 2.15, gcc 3.5, glibc 2.3.3)
	progress
Date: Mon, 12 Jul 2004 11:14:41 +0000
Message-ID: <40F272A1.4040006@tiscali.be>
References: <40E6A00E.8020203@tiscali.be>
	<40BD9F05000175F1@ocpmta1.freegates.net>
	<20040709183243.GJ4759@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040709183243.GJ4759@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Carlos,

Sorry for late answer, but I take some hollidays with my wife :)

Carlos O'Donell wrote:
> On Wed, Jul 07, 2004 at 07:02:37PM +0200, Joel Soete wrote:
> 
[...]

>>>>
>>for a run i got r25==0x4004b000
>>
>>and the corresponding mapping at this moment is:
>>00010000-00011000 r-xp 00000000 08:0b 142497     /Develop/parisc-linux/build/glibc/localedata/tst-leaks
>>00020000-00021000 rwxp 00000000 08:0b 142497     /Develop/parisc-linux/build/glibc/localedata/tst-leaks
>>40000000-40004000 rw-p 40000000 00:00 0
>>4004b000-4004c000 r--p 00000000 08:0b 2632       /Develop/parisc-linux/build/glibc/localedata/de_DE.ISO-8859-1/LC_IDENTIFICATION
>>403eb000-40529000 r-xp 00000000 08:0b 18692      /Develop/parisc-linux/build/glibc/libc.so
>>40529000-40536000 rwxp 0012e000 08:0b 18692      /Develop/parisc-linux/build/glibc/libc.so
>>40536000-40538000 rwxp 40536000 00:00 0
>>410bd000-410d4000 r-xp 00000000 08:0b 196300     /Develop/parisc-linux/build/glibc/elf/ld.so
>>410e3000-410e7000 rwxp 00016000 08:0b 196300     /Develop/parisc-linux/build/glibc/elf/ld.so
>>410e7000-41108000 rwxp 410e7000 00:00 0
>>bff00000-bff02000 rwxp bff00000 00:00 0
> 
> 
> That seems reasonable, it's trying to load the first word from the
> locale data. Not sure why that would crash. Is it still crashing in the
> same place?

Yes it always crashed at the same place.
That is why I would like to back traced the calling function to see if some space register is not broken?

>  
> 
>>I try to compare with glibc build with gcc-3.3.4 (that takes me some time
>>to remember That I have also to upgrade my kernel to make gdb stop at a
>>break point :( ) and I got the same matching r25 == map address of 
>>/Develop/parisc-linux/build/glibc/localedata/de_DE.ISO-8859-1/LC_IDENTIFICATION.
>>But with gcc-3.3.4 that can continue not with gcc-3.5????
> 
> 
> You have to get near that insn sequence and then start doing a binary
> stepping, usually like "si 1000" or something and then if you crash
> restart the process and keep going. You need to determine why the
> sequence would crash. Currently it looks like it shouldn't, which means
> we are probably looking at the wrong insns.
> 
> 
>>What do I miss?
> 
> 
> We are probably looking at the wrong insns.
> 
> c.
> 
> 
Well, ok it should be that gdb didn't show me the right stuff and so the only way I foreseen in this case is to introduce some 
printf (if posible, but iirc it's not) from place to place?

I will so continue.

Thanks for help,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
