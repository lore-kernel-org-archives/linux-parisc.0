Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA30999
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Mar 2000 13:43:22 -0700
Date: Tue, 21 Mar 2000 14:44:50 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSO.4.21.0003211437430.8233-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] parisc gcc compile on ALPHA
List-ID: <linux-parisc.vger.kernel.org>


I'm back to trying to get things to build on my ALPHA.
I've got binutils built and installed (even managed to 
trick the debian packaging scripts into making a package 
w/o ld :)

gcc currently fails thusly -- which is better than the
way it used to fail before I just updated from cvs.  Is
this arch specific or is the assembly stuff still a moving
target?

/usr/src/parisc/gcc/gcc/xgcc -B/usr/src/parisc/gcc/gcc/
-B/usr/src/parisc/hppa1.1-linux/bin/
-I/usr/src/parisc/hppa1.1-linux/include -DCROSS_COMPILE -DIN_GCC
-DMULTIBYTE_CHARS=1   -g -O2  -I./include  -c dummy.c
/tmp/cc0ujkeP.s: Assembler messages:
/tmp/cc0ujkeP.s:1: Error: Bad expression
/tmp/cc0ujkeP.s:1: Warning: Missing string
/tmp/cc0ujkeP.s:1: Error: Rest of line ignored. First ignored character is
`d'.
/tmp/cc0ujkeP.s:1: Error: Rest of line ignored. First ignored character is
`.'.
/tmp/cc0ujkeP.s:28: Error: Unknown pseudo-op:  `.export'
/tmp/cc0ujkeP.s:30: Error: unknown opcode `__foo'
/tmp/cc0ujkeP.s:31: Error: Rest of line ignored. First ignored character
is `-'.
/tmp/cc0ujkeP.s:33: Error: unknown opcode `__foo'
/tmp/cc0ujkeP.s:34: Warning: Expected comma after name ""
/tmp/cc0ujkeP.s:34: Warning: unhandled: .proc
 .CALLINFO FRAME=0,NO_CALLS
 .ENTRY
 bv,n %r0(%r2)
 .EXIT
 .PROCEND
.Lfe1:
 .size __foo,.Lfe1-__foo
.Lscope0:
 .stabs "",36,0,0,.Lscope0-__foo
 .text
 .stabs "",100,0,0,Letext
Letext:
 .ident "GCC: (GNU) 2.9-hppa-991112"
,0
/tmp/cc0ujkeP.s:34: Error: Rest of line ignored. First ignored character
is `.'.
/tmp/cc0ujkeP.s:35: Error: Unknown pseudo-op:  `.entry'
/tmp/cc0ujkeP.s:36: Error: syntax error
/tmp/cc0ujkeP.s:37: Error: Unknown pseudo-op:  `.exit'
/tmp/cc0ujkeP.s:38: Error: Unknown pseudo-op:  `.procend'
make[1]: *** [libgcc1.null] Error 1


--
Brian S. Julin
