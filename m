From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] new toolchain (binutils 2.15, gcc 3.5, glibc 2.3.3)
	progress
Date: Sat, 03 Jul 2004 12:01:18 +0000
Message-ID: <40E6A00E.8020203@tiscali.be>
References: <40BD9F8700014B6E@ocpmta2.freegates.net>
	<20040702165304.GM19793@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040702165304.GM19793@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
>>I can now reproduce what happend during check :)
>>and the crash occurs now at 0x401f67a8
>>
>>and ddd offers me a related dump window:
>>Dump of assembler code from 0x401f67a8 to 0x401f68a8:
>>    0x401f67a8:     ldw 0(,r25),r21
>>    0x401f67ac:     ldo 1115(r20),r20
> 
> 
> Joel, the most important code is what came *before* teh crash insn, you
> usually want atleast 16-32 insns before the crash to see what was going
> on, usually I trace back to try find the start of the function.
> 
> 
>>0002c77c <_nl_intern_locale_data>:
>>   2c77c:       6b c2 3f d9     stw rp,-14(,sp)
>>   2c780:       6f c6 00 80     stw,ma r6,40(,sp)
>>   2c784:       08 1a 02 46     copy r26,r6
>>   2c788:       6b c5 3f 89     stw r5,-3c(,sp)
>>   2c78c:       08 19 02 45     copy r25,r5
>>   2c790:       6b c3 3f 99     stw r3,-34(,sp)
>>   2c794:       08 18 02 43     copy r24,r3
>>   2c798:       6b c4 3f 91     stw r4,-38(,sp)
>>   2c79c:       8f 0e 81 d0     cmpib,>>= 7,r24,2c88c <_nl_intern_locale_data+0x110>
>>   2c7a0:       6b d3 3f c1     stw r19,-20(,sp)
>>   2c7a4:       22 98 04 00     ldil 20030000,r20
>>==>2c7a8:       0f 20 10 95     ldw 0(,r25),r21
> 
> 
> You are trying to get data from a pointer passed in as the second
> parameter to the function, you want to see the value of r25 before the
> load to see if it is valid. In gdb you can print register values or just
> use the info command to see all the regs. You can display regs by using
> '$r25' AFAIR, though the format may vary.
> 
ah I see
And btw if I put a break at 0x401f677c (corresponding to line 2c77c: the first routine insn), I would also be able to find the 
address from where it's called (just have to find back the right register).
Thanks for the tips.

> 
>>(gdb) break set_dp (if i well understand?)
> 
> 
> Yes, that's *very* early on. I try to break the startup in fixup().
> 
ok I will do so ;)

> 
>>and the prgm stop well at the requested address but unforunately bt still
>>refuse to unwind :(
> 
> 
> You won't get *any* usefull unwind info from debugging the loader, it's
> all very difficult during the early relocation process because the
> debugger doesn't understand what is being loaded where.
>  
Ok
> 
>>It seems so that the libc itself doesn't hown enough info for unwind. Is
>>-g option is enough or is there another configure option I missed or is
>>it possible to abuse a bit makefile files to force the libc build with more
>>usable info?
> 
> 
> There are tricks to debug programs that use the new loader, but if the
> loader is dying then there isn't much you can do except hack at from
> assembly.
> 
In fact I don't expect very much from assembly but hope more from gdb tracing back the way of process.
(I don't have any background about any loader so have all to learn :)

Thanks for advises,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
