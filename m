Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A7B9482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 00:10:57 -0600 (MDT)
Message-Id: <200109060608.AAA09806@puffin.external.hp.com>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs update gives 'move away ....' on every file 
In-Reply-To: Message from thunder7@xs4all.nl
   of "Thu, 06 Sep 2001 07:35:38 +0200." <20010906073538.A12771@middle.of.nowhere>
Date: Thu, 06 Sep 2001 00:08:10 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

thunder7@xs4all.nl wrote:
> So this shouldn't happen:
> 
> jurriaan@pa8200:/home/cvs/parisc$ tar zxf ~/source/linux-20010831.tar.gz
> jurriaan@pa8200:/home/cvs/parisc$ echo $CVSROOT
> :pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
> jurriaan@pa8200:/home/cvs/parisc$ cvs update -APd linux
> cvs update: move away linux/.cvsignore; it is in the way
> C linux/.cvsignore

Sorry. It doesn't happen to me.

I get the following:
grundler <518>cvs update -APd linux
cvs update: in directory linux:
cvs update: ignoring CVS/Root because it specifies a non-existent repository /home/cvs/parisc
...
ad nauseum for every CVS/Root file in the tree.

One needs to:
1) echo $CVSROOT > ~/Root
2) find linux -name Root -exec cp ~/Root \{\} \;

(CVSROOT is the ":pserver:..." value posted several times earlier.)

I'm not sure who owns the script that make tarballs from cvs source trees.
But adding those two steps would take care of this for most people.


Now I get:
grundler <523>cvs update -APd linux
P linux/Makefile
P linux/arch/parisc/kernel/hardware.c
grundler <524>pwd
/home/grundler
grundler <525>cat ~/.cvsrc
cvs -z3 -q
diff -uNp
update -Pd
rm -f
grundler <526>head -4 linux/Makefile
VERSION = 2
PATCHLEVEL = 4
SUBLEVEL = 9
EXTRAVERSION = -pa15
grundler <527>echo $CVSROOT
:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
grundler <528>


I already forgot I don't need to specify "-Pd" options
on the command line... :^)

grant
