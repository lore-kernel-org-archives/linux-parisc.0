From: Alexander Gabert <pappy@nikita.ath.cx>
Subject: [parisc-linux] 199f on parisc (now it is ready to go :-)
Date: Mon, 14 Apr 2003 21:05:33 +0200
Message-ID: <20030414190533.GA6323__32507.3107182563$1416622385$gmane$org@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org,
	netzwurm@debian.org, teq@nikita.ath.cx
To: grsecurity@grsecurity.net
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

hi,

with the great help from the pageexec folks, we are now able to set up our debian
hppa parisc boxes with a very cool security patch!

grsecurity with PaX delivers the first working security hardened kernel
plus effective acl system with userland restrictions to parisc-linux.

currently, you will be able to find the parisc-only patch at:
http://nikita.ath.cx/users/pappy/grsec/199f_parisc_only_PaX/

the README shortly explains, what it is all about.

play with it, play with it, play with it, tell me what you think of it.

Brad, could you please try to merge the technical changes into your sources?
or would this be counterproductive, regarding the "difference" the parisc-linux kernel makes?
i know, that currently we are in split-brain mode regarding parisc-linux
kernel sources.  but i really hope, we get together at 2.5.* :-)

i can send the patch to you per mail also.

Dear Debian-Hppa developers,

http://pageexec.virtualave.net/docs/randmmap.txt and the other documents
require "full" ET_DYN support for elf binary executables in the system
plus some "minor" gcc patching to get the stuff going :-)

is it possible to "phase in" a secure debian-hppa distribution,
something like Debian Trusted already tries to achieve?
we could have a separate "security-oriented" gcc, library and binary packages there.

we need the following for random mmap and the advanced features to work:
(excerpt from pageexec et_dyn/README)
   Compilation has to be modified in order to produce position independent
   code (PIC) which in turn allows the linker to not emit so-called text
   relocations in the final ET_DYN ELF file.

this has to be done on as much as binaries and libraries.

i can do it on my own.  but i want it to be addressed in debian.
we can call up for a "debian-hppa-trusted" for example :-)

there is also work that needs to be done on the glibc on parisc to better support the PaX features.
more details if someone feels addressed and answers :-)


I now personally want to thank the PaX team for doing this brilliant, open, portable work in
creating a security solution for the platform independent linux kernel.
i appreciate working together with you and will definitely stay in
contact with you.

David: You can mention this in your article, if it is not yet finished and being printed ;-)


have a nice week,

see you,


Alex
-- 
"... an experienced, industrious, ambitious, and often quite often
picturesque liar."
                -- Mark Twain

pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <pappy@nikita.ath.cx>
          Key fingerprint =  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7F D6  05 E1 A8 0C
