Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 847564A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 08:29:52 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA01387
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Feb 2001 02:29:50 +1100
Date: Sat, 10 Feb 2001 02:29:50 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] pipes
List-ID: <linux-parisc.vger.kernel.org>

Would anyone like to hazard a guess as to whether pipes work OK?

The fixincludes problem I'm seeing with devel branch gcc builds looks like
a loss of data in a pipe.  fixincl does a fairly standard trick of opening
a pipe(2) to a fork & exec'd shell, and by putting a little debugging code
in I see some fishy commands in the shell.

Good debug info looks like:

==
case hppa-unknown-linux-gnu in
*-*-sysv4* | \
i?86-*-sysv5* | \
i?86-*-udk* | \
i?86-*-solaris2.[0-4] | \
powerpcle-*-solaris2.[0-4] | \
sparc-*-solaris2.[0-4] )
    echo run ;;
* ) echo skip ;;
esac
==
cd /usr/include
case hppa-unknown-linux-gnu in
*-*-sysv4* | \
i?86-*-sysv5* | \
i?86-*-udk* | \
i?86-*-solaris2.[0-4] | \
powerpcle-*-solaris2.[0-4] | \
sparc-*-solaris2.[0-4] )
    echo run ;;
* ) echo skip ;;
esac

echo
echo ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd

where the first hunk of text between `=='s is wrapped in
`cd /usr/include' .. `echo funky stuff' and plugged into the pipe.  The
hunk of text after the second `==' is what the shell reads from the pipe.
Everything works as expected for a while, and then we get

==
file=sys/stat.h
if ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1
then echo TRUE
else echo FALSE
fi
==
cd /usr/include
file=sys/stat.h
if ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1
then echo TRUE
else echo FALSE
fi
d

Oops, did we just lose 41 chars?

Unfortunately, I'm not sure where the loss happens.  When I tried to
"strace -f -s 256 ...", I ran into

User Fault on Kernel Space pid=319 command='sh'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 00076808 0002b4c7 00000001
r4-7     401e8648 00000000 0000008b 0007dda8
r8-11    00000001 00076808 0007f008 00078008
r12-15   00076808 00078f02 00076808 bb000ac8
r16-19   00076808 00063800 ffffffff 401e8648
r20-23   000000af 400f0258 0007e498 00000008
r24-27   00000000 bb000ac8 00000002 00076808
r28-31   00000000 00000000 bb000c00 400f027f
sr0-3    0000035e 0000035c 00000000 0000035e
sr4-7    0000035e 0000035e 0000035e 0000035e

IASQ: 00000000 00000000 IAOQ: 400f027f 400f0283
 IIR: 4ad30048    ISR: 0000035e  IOR: 0007e4bc
ORIG_R28: ffffffff

0x400f0270 <__sigprocmask+24>:  stw r3,-3c(sr0,sp)
0x400f0274 <__sigprocmask+28>:  be,l 100(sr2,r0),%sr0,%r31
0x400f0278 <__sigprocmask+32>:  ldi af,r20
0x400f027c <__sigprocmask+36>:  copy ret0,r3

Tried various kernels I built near the end of January, and one dated
20010201 "Linux version 2.4.0-test10 (jsm@forest)" from Matt Taggart.

Time to sleep on it, I think

Alan
