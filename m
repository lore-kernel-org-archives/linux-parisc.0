Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11104
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 17:05:37 -0700
To: Sam Creasey <sammy@sammy.net>
Cc: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] new binutils/gcc 
In-reply-to: Your message of "Sun, 27 Feb 2000 13:26:55 EST."
             <Pine.LNX.4.21.0002271322290.365-100000@sammyville.sammy.net>
Date: Tue, 29 Feb 2000 16:06:35 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12Pvit-0003UI-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= There is, in fact, a relationship there.  r8 isn't set properly at any
= time, it's kludged.  r8 needs to be set to 
= (load addr of .text) & 0xfff00000.   Basically this is used as a pointer
= to the stub table for long branching.  (so, it should be a jump to
= 0xc010049c, which ought to be a stub for start_parisc())

Don't "be" branches cause a pipeline flush?  It might be faster to
do two "bl" branches instead?

= Yeah, it's kinda ugly...  the linker and crt0.S both need to be
= taught about this too.

Ok, I fixed head.S and interruption.S.  After hacking on vmlinux.lds
and a couple small other things, the elf kernel boots to the point
where I need a ramdisk or NFS root to go further, so that's my plan.
Sources are in CVS with the ELF_BRANCH tag.

Things to do:

    The init_task_union alignment is in both vmlinux.lds and
    is known by setup.c and #defined yet another place.  This ought
    to be cleaned up if possible.

    The init_task_union printf in setup.c should be fixed.

    It's probably time to start using the __setup stuff we hacked
    around for SOM.

    Fix 'make Image' or nuke it.  'make palo' works (for me anyway)

    Sammy said, and I didn't touch these (though others have in the
    main line):

	I guarantee that launching som/elf binaries won't work.  page faulting
	looks messed up somewhere.

	execve() might not work in this one..   I played with the assembler for
	it, but good things never happened, so no changes included.


			-Paul Bame
