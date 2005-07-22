From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Fri, 22 Jul 2005 22:04:55 +0000
Message-ID: <42E16D87.7040307@tiscali.be>
References: <IJXN2N$DA7727996AD92DCEF0C4B526A04147B8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: dave <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IJXN2N$DA7727996AD92DCEF0C4B526A04147B8@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

Discussing with Carlos I figure out that insteresting stuff:

I didn't find in p-l the fp init stuff (may be I coud also missed it)
as decribe at page 9-9 and as encountered in hpux-1100 (32 or 64bit)

00000000001302e0 <fprinit>:
   1302e0:       73 c2 3f e1     std rp,-10(sp)
   1302e4:       03 00 08 a2     mfctl tr0,rp
   1302e8:       48 42 00 d0     ldw 68(rp),rp
   1302ec:       c7 02 c0 62     bb,>=,n rp,18,130324 <nofprinit>
   1302f0:       20 32 90 0e     ldil 7a4800,r1
   1302f4:       34 21 0c 70     ldo 638(r1),r1
   1302f8:       2c 20 12 00     fstd fr0,0(,r1)
   1302fc:       30 00 00 00     fid
   130300:       2c 20 12 00     fstd fr0,0(,r1)
   130304:       0c 20 10 81     ldw 0(,r1),r1
   130308:       0f 41 12 80     stw r1,0(,r26)
   13030c:       20 52 90 0e     ldil 7a4800,rp
   130310:       34 42 0b 10     ldo 588(rp),rp
   130314:       2c 40 10 00     fldd 0(,rp),fr0
   130318:       2c 40 10 01     fldd 0(,rp),fpe2
   13031c:       2c 40 10 02     fldd 0(,rp),fpe4
   130320:       2c 40 10 03     fldd 0(,rp),fpe6

0000000000130324 <nofprinit>:
   130324:       53 c2 3f e1     ldd -10(sp),rp
   130328:       e8 40 d0 00     bve (rp)
   13032c:       08 00 02 40     nop
[...]

000000000013038c <get_fpuinfo>:
   13038c:       22 d2 90 0e     ldil 7a4800,r22
   130390:       36 d6 0c 80     ldo 640(r22),r22
   130394:       2e c0 12 00     fstd fr0,0(,r22)
   130398:       30 00 00 00     fid
   13039c:       22 d2 90 0e     ldil 7a4800,r22
   1303a0:       36 d6 0c 80     ldo 640(r22),r22
   1303a4:       2e c0 12 00     fstd fr0,0(,r22)
   1303a8:       22 d2 90 0e     ldil 7a4800,r22
   1303ac:       4a dc 0c 80     ldw 640(r22),ret0
   1303b0:       e8 40 c0 00     bv r0(rp)
   1303b4:       08 00 02 40     nop

called into <processor_init>:
...
   33b60c:       ea fa b2 a1     b,l 12ff64 <set_coproc_config>,%r2
   33b610:       37 dd 3f e1     ldo -10(sp),ret1
   33b614:       48 98 0d c0     ldw 6e0(r4),r24
   33b618:       34 13 01 80     ldi c0,r19
   33b61c:       0b 13 02 1f     and r19,r24,r31
   33b620:       68 9f 0d c0     stw r31,6e0(r4)
   33b624:       2b 60 30 00     addil 1800,dp,%r1
   33b628:       48 21 0c e0     ldw 670(r1),r1
   33b62c:       88 20 22 6a     cmpb,<>,n r0,r1,33b768 <processor_init+0x1c0>
   33b630:       48 82 0d c0     ldw 6e0(r4),rp
   33b634:       d8 59 0b e0     extrd,u rp,63,32,r25
   33b638:       34 1a 00 14     ldi a,r26
   33b63c:       ea fa a1 99     b,l 12f710 <mtctl>,%r2
   33b640:       37 dd 3f e1     ldo -10(sp),ret1
   33b644:       2b 60 30 00     addil 1800,dp,%r1
   33b648:       34 3a 0f a8     ldo 7d4(r1),r26
   33b64c:       ea fa b9 19     b,l 1302e0 <fprinit>,%r2
   33b650:       37 dd 3f e1     ldo -10(sp),ret1
...

and some realted fnct:
000000000012ff2c <get_coproc_config>:
   12ff2c:       03 00 08 b6     mfctl tr0,r22
   12ff30:       4a dc 00 d0     ldw 68(r22),ret0
   12ff34:       d7 9c 08 18     depw,z ret0,31,8,ret0
   12ff38:       e8 40 d0 00     bve (rp)
   12ff3c:       08 00 02 40     nop

000000000012ff40 <set_fpu_type_config>:
   12ff40:       03 00 08 b6     mfctl tr0,r22
   12ff44:       52 d5 00 40     ldd 20(r22),r21
   12ff48:       6a ba 02 20     stw r26,110(r21)
   12ff4c:       6a da 00 d8     stw r26,6c(r22)
   12ff50:       e8 40 d0 00     bve (rp)
   12ff54:       08 00 02 40     nop

000000000012ff58 <getfputypeflags>:
   12ff58:       03 00 08 b6     mfctl tr0,r22
   12ff5c:       e8 40 c0 00     bv r0(rp)
   12ff60:       4a dc 00 d8     ldw 6c(r22),ret0

000000000012ff64 <set_coproc_config>:
   12ff64:       03 00 08 b6     mfctl tr0,r22
   12ff68:       4a d5 00 d0     ldw 68(r22),r21
   12ff6c:       d6 ba 0c 18     depw r26,31,8,r21
   12ff70:       6a d5 00 d0     stw r21,68(r22)
   12ff74:       e8 40 d0 00     bve (rp)
   12ff78:       08 00 02 40     nop

Hth,
	Joel

soete.joel wrote:
>>>Dave would you mean that c3k was runing parisc-linux and a500 hpux?
>>
>>Correct.
>>
> 
> Ok clear.
> 
> 
>>>Is there some pb in sgl -> udw convertion?
>>
>>Could be.  There is a significant different between PA 1.x and 2.0
>>in this respect.  PA 2.0 has "hardware" instructions to do these
>>conversions.  GCC currently uses these instructions when generating
>>PA 2.0 code.
> 
> 
> After severall hours of test, I changed my mind.
> 
> I have my ws runing hpux 11.00 and gcc to compile pr code ;-)
> 
> I have a n4k 2-way pa8600 550Mhz testing parisc-linux 2.6.12-pa2-n4ksmp
> (ggc-4.0 + fpr limits) 
> 
> I can also use a developement n4k 4-way pa8600 440Mhz (not od this clock)
> runing hpux 11.00 (with latest patch bundle).
> 
> First thing on p-l I noticed:
> I get rid of unsigned by:
> long long
> f2ull(float f)
> {
>  return (long long) f;
> }
> 
> And it print well 'f2ull((float) ((~0ULL) >> 1)) = 0x7fffffffffffffff'
> 
> I let you also check the resulting .s file when I play with following:
> unsigned long long
> f2ull(float f)
> {
>   long long tmp = (long long) f;
>   return (unsigned long long) temp;
> }
> 
> Semanticaly it would be the same as the original but the result is also:
> 'f2ull((float) ((~0ULL) >> 1)) = 0x7fffffffffffffff' ?
> 
> Now the brain shacking ;-)
> 
> the behaviour comparison between hpux and p-l (on the original code):
> I used some gui gdb helper (wdb on hpux and insight and ddd on p-l)
> 
>     * at the end of f2ull() ret0 and ret1 (aka r28 & r29) are well different:
>         hpux: r28 == 0x80000000; r29 == 0x00000000,
>         p-l : r28 = r29 == 0x80000000
>     ???? (the code of .s file is quite the same ;-)
> 
>     * very strange is the very difference of fpsr:
>       (e.g. after fldw r3(,ret0),fr22
>             hpux : fpsr == 0x40
> 
>             after next fcnv insn
>             hpux : fpsr == 0x80000000; 
> 
>             p-l  : fpsr stay constantly == 0x0
> 
> So as far as this time the 2 hw are nearly the same, as well as the executable
> txt, the 2 previous test make me better thought that fpu are 'configurable'
> (may be not all model) and are not setup the same way by the different OS. 
> That said, I never read anything about this but i don't see other reasonable
> explanation?
> 
> 
> Joel
> 
> PS:
> obviously gdb relase are very different on the 2 systems, but I hope that such
> 'printf "%x\n", $fpsr' (or what else as reg) could show me actual cpu reg
> value, though.
> 
> 
> 
> -------------------------------------------------------
> NOTE! My email address is changing to ... @scarlet.be
> Please make the necessary changes in your address book. 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
