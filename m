Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA07494
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 13:44:51 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 4521D35C2
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Oct 2000 12:46:21 -0700 (PDT)
Date: Wed, 25 Oct 2000 12:51:03 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010251951.MAA21150@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Cc: opensource@cup.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa64-linux gcc bug
List-ID: <linux-parisc.vger.kernel.org>

Hi Folks,

We think we found a "heisenbug" which has been bothering us
for the past couple of weeks during hppa64-linux developement:
create_proc_entry() "works" when a printk() is added and otherwise
passes garbage as the "parent" argument when calling proc_register().

We need some help in fixing the compiler though.

We haven't had a chance to talk to linuxcare (toolchain support
for hppa*-linux provider) yet since Alan Modra is in .au.
Though this seems like a "generic" hppa bug to me, I doubt it's
in the currently published hppa2.0-hpux toolchain.

[ Note : hppa64-linux tool chain isn't fully merged up with the
  FSF developement trees and can be viewed at:
	http://puffin.external.hp.com/cgi-bin/cvsview/
  OR
	ftp puffin.external.hp.com:/pub/parisc/cvs/*-latest.tar.gz
]


Here's the IRC transcript from John Marvin (jsm@fc.hp.com):

<jsm> There is definitely at least one bug in the 64 bit compiler. The code it
  generates for create_proc_entry is garbage. That could be just one
  manifestation of the heisenbug. 
...
<jsm> If you guys want to attempt it, look at how "parent" is handled. It
  stores r24 at -30 off of the ap (ret1), if it has to call xlate_proc_name
  that is OK, but when it calls proc_register it is calling it with -30 off of
  the new ret1.
<jsm> i.e. the new ap which is -10 off of the new sp, not the original one.
<jsm> It actually does ldo -10(sp),ret1, then ldo -40(ret1),r19, then ldd
  10(r19),r26.
<jsm> but the effect is the same. I'll write it up when I get into work if you
  guys don't beat me to it.



Let me extract the generic.s output that jsm talks about above:
			
0000000000000000 <create_proc_entry>:
   0:   0f c2 12 c1     std  rp,-10(sr0,sp)
   4:   37 de 02 00     ldo 100(sp),sp		[ new_sp == orig_sp + 0x100 ]
...
  24:   73 b8 3f a1     std r24,-30(ret1)	[ "parent" input parm ]
...
  2c:   53 b3 3f a1     ldd -30(ret1),r19	[ if (!parent && ...) ]
  30:   9e 66 22 68     cmpb,*= r6,r19,16c <create_proc_entry+0x16c>
  34:   db 23 0b f0     extrd,u r25,63,16,r3
...
  94:   e8 00 a0 00     call 9c <create_proc_entry+0x9c>
                        94: R_PARISC_PCREL22F   memcpy
  98:   37 dd 3f e1     ldo -10(sp),ret1
...
  d8:   37 dd 3f e1     ldo -10(sp),ret1
  dc:   37 b3 3f 81     ldo -40(ret1),r19
  e0:   08 06 02 59     copy r6,r25
  e4:   e8 00 a0 00     call ec <create_proc_entry+0xec>
                        e4: R_PARISC_PCREL22F   proc_register
  e8:   52 7a 00 20     ldd 10(r19),r26

Recall "parent" input parm was stored at -0x30(orig_ret1).
And now we are effectively trying to reload from -0x40(new_sp).
That would be ok if orig_ret1 == -0x10(new_sp).
But it doesn't:  orig_ret1 == -0x100-0x10(new_sp)

So either "parent" is getting stored to the wrong relative stack
location or is getting reloaded from the wrong one.

Kudos to John - good catch!


The following is available via anon ftp from hpisp747:pub/heisenbug/
o generic.gcc: hppa64-linux-gcc command line to compile generic.c
o *.S are generic.gcc output w/-S added
o *.s files are "hppa64-linux-objdump -rD" output
o '*.prt.*' files have a printk() statement added to create_proc_entry()
  and proc_mkdir() to compare the code generation.


thanks,
grant


ps. Right now, I'm pretty sure I don't want to know why gcc
    doesn't just issue "ldo -100+0x30(sp),r26" instead of fooling
    around w/ret1 (arg ptr).
