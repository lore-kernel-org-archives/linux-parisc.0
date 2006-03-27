From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Mon, 27 Mar 2006 06:46:00 +0100
Message-ID: <IWRUOO$5330BBF8C58E5D93EB8E702EE1864A91@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I'm not sure about the debian status.  I believe that Matthias integr=
ated
> > the change but there was a regression due to a missing glibc patch
> > needed to prevent a SIGSEGV in the unwind code.  Matthias said this
> > problem was fixed on March 20.
> 
> 2.3.6-3 does't have the fix:
> 
> dave@hiauly6:~$ objdump -d /lib/libpthread.so.0
> /lib/libpthread.so.0:     file format elf32-hppa-linux
> 
> Disassembly of section .init:
> 
> 000041ac <_init>:
>     41ac:       6b c2 3f d9     stw rp,-14(sp)
>     41b0:       6f c4 00 80     stw,ma r4,40(sp)
>     41b4:       6b d3 3f c1     stw r19,-20(sp)
>     41b8:       e8 42 02 a0     b,l 8310 <__pthread_initialize_minimal>=
,rp
>     41bc:       08 13 02 44     copy r19,r4
>     41c0:       08 04 02 53     copy r4,r19
>     41c4:       e8 40 0c 70     b,l 4804 <frame_dummy>,rp
>     41c8:       08 00 02 40     nop
>     41cc:       e8 44 1d 2c     b,l e068 <__do_global_ctors_aux>,rp
>     41d0:       08 00 02 40     nop
>     41d4:       4b c2 3f 59     ldw -54(sp),rp
>     41d8:       08 04 02 53     copy r4,r19
>     41dc:       e8 40 c0 00     bv r0(rp)
> 
> 000041e0 <_end_init>:
>     41e0:       4f c4 3f 81     ldw,mb -40(sp),r4
> 
> This .init section isn't built correctly in shared libraries.  The
> PIC register r19 needs to be retored after every call if it is
> subsequently used.  As can be seen above, there is no restore after
> the call to frame_dummy and r19 is needed for the call to
> __do_global_ctors_aux.
> 
mmm not yet in 2.3.6-4:
# objdump -d /lib/libpthread.so.0 | more

/lib/libpthread.so.0:     file format elf32-hppa-linux

Disassembly of section .init:

000041ac <_init>:
    41ac:       6b c2 3f d9     stw rp,-14(sp)
    41b0:       6f c4 00 80     stw,ma r4,40(sp)
    41b4:       6b d3 3f c1     stw r19,-20(sp)
    41b8:       e8 42 02 a0     b,l 8310 <__pthread_initialize_minimal>,r=
p
    41bc:       08 13 02 44     copy r19,r4
    41c0:       08 04 02 53     copy r4,r19
    41c4:       e8 40 0c 70     b,l 4804 <frame_dummy>,rp
    41c8:       08 00 02 40     nop
    41cc:       e8 44 1d 2c     b,l e068 <__do_global_ctors_aux>,rp
    41d0:       08 00 02 40     nop
    41d4:       4b c2 3f 59     ldw -54(sp),rp
    41d8:       08 04 02 53     copy r4,r19
    41dc:       e8 40 c0 00     bv r0(rp)

000041e0 <_end_init>:
    41e0:       4f c4 3f 81     ldw,mb -40(sp),r4
Disassembly of section .text:
=3D=3D=3D=3D<>=3D=3D=3D=3D

and the same with my testing 2.3.6-4.1 build with gcc dpkg:
dpkg -l gcc-4.0
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-install=
ed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: uppe=
rcase=3Dbad)
||/ Name                        Version                     Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
ii  gcc-4.0                     4.0.3-1                     The GNU C com=
piler

Thanks,
    Joel
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
