Return-Path: <carlos@baldric.uwo.ca>
Received: from fep02-mail.bloor.is.net.cable.rogers.com
	(fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 772944856
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 15:55:06 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep02-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040130225248.JDDP246674.fep02-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 17:52:48 -0500
Date: Fri, 30 Jan 2004 17:55:29 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Constructor not run in 3.3.3, but does run in 3.0.4
Message-ID: <20040130225527.GV19840@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> When all is said and done it should print '0123456789', but right now it
> prints '012356789', skipping '4'. If I compile with gcc-3.0.4 it
> complains about:
> /home/carlos/src/glibc-work/src/libc/include/unistd.h:71: warning:
> `visibility' attribute directive ignored
> 
> 69 char *__canonicalize_directory_name_internal (__const char *__thisdir,
> 70                                               char *__buf,
> 71                                               size_t __size) attribute_hidden;
> 
> Seems like a red-herring. However, with gcc-3.0.4 everything works just
> fine. The order of the initializers is back to normal.
> 
> Is there any fragile system by which the linker finds and labels the
> executables 'init'?

I can see atleast two stubs missing in the gcc-3.3 compiled code:

---
     47         ea a0 c0 00     bv r0(r21)
     48 -       48 33 02 b8     ldw 15c(r1),r19                                
     49 -       2b 60 00 00     addil 0,dp,%r1
     50 -       48 35 02 40     ldw 120(r1),r21                                
     51 -       ea a0 c0 00     bv r0(r21)
     52 -       48 33 02 48     ldw 124(r1),r19                                
     53 -       2b 60 00 00     addil 0,dp,%r1
     54 -       48 35 02 a0     ldw 150(r1),r21                                
     55 -       ea a0 c0 00     bv r0(r21)
     56 -       48 33 02 a8     ldw 154(r1),r19                                
     57 +       48 33 02 b0     ldw 158(r1),r19                            
---

The old code called __do_global_ctors_aux directly, while the new code
seems to be running this through __canonicalize_funcptr_for_compare.
Same can be said for __do_global_dtors_aux.

I started poking the binary in order watch the insn flow, and the code
makes it into __do_global_ctors_aux, but the comparison in 10b9c fails,
and the constructor is never called. I guess I should be reviewing the
generic function pointer code.

---
00010b78 <__do_global_ctors_aux>:
   10b78:       6b c2 3f d9     stw rp,-14(sp)
   10b7c:       6f c4 01 00     stw,ma r4,80(sp)
   10b80:       6b c3 3f 09     stw r3,-7c(sp)
   10b84:       2b 60 00 00     addil 0,dp,%r1
   10b88:       34 23 02 18     ldo 10c(r1),r3
   10b8c:       e8 5f 1d 65     b,l 10a44 <__canonicalize_funcptr_for_compare>,rp
   10b90:       0c 60 10 9a     ldw 0(,r3),r26
   10b94:       34 1a 3f ff     ldi -1,r26
   10b98:       e8 5f 1d 4d     b,l 10a44 <__canonicalize_funcptr_for_compare>,rp
   10b9c:       08 1c 02 44     copy ret0,r4
   10ba0:       80 9c 20 22     cmpb,=,n ret0,r4,10bb8 <__do_global_ctors_aux+0x40>
   10ba4:       0c 60 10 96     ldw 0(,r3),r22
   10ba8:       eb ff 1c fd     b,l 10a2c <$$dyncall>,r31
   10bac:       08 1f 02 42     copy r31,rp
   10bb0:       e8 1f 1f ad     b,l 10b8c <__do_global_ctors_aux+0x14>,r0
   10bb4:       34 63 3f f9     ldo -4(r3),r3
   10bb8:       4b c2 3e d9     ldw -94(sp),rp
   10bbc:       4b c3 3f 09     ldw -7c(sp),r3
   10bc0:       e8 40 c0 00     bv r0(rp)
   10bc4:       4f c4 3f 01     ldw,mb -80(sp),r4
---

In the gcc-3.0.4 code the cffc is gone and the executables init runs
correctly. Time to review a few things :)

c.
