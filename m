Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA16369
	for <parisc-linux@sod.res.cmu.edu>; Fri, 16 Apr 1999 16:02:09 -0400
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id QAA23045
	for <parisc-linux@thepuffingroup.com>; Fri, 16 Apr 1999 16:01:45 -0400
Date: Fri, 16 Apr 1999 16:01:45 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990416155029.27211L-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Some things to do...
List-ID: <linux-parisc.vger.kernel.org>


I just thought I'd revive things by spitting out a few things on the grand
to do list; I'm sure I'm missing things.  Please pipe up.

1. Fixing binutils

There's problems with binutils and linking.  I can't tell you precisely
what because I don't understnad it myself.  I know we need to resolve the
ELF situation.  Ulrich, comments on this?

2. Kernel stuff

Even the basic kernel building needs a lot of help; doing a 'make dep'
shouldn't build the whhole thing.  A non-kernel aware person might have
fun with that.

There's of course MMU and interrupt stuff, but we need the binutils sorted
out first I suspect.

3. Renaming.

I suspect cygnus isn't going to like this a whole lot, but really the
*true* name of the CPU is PA RISC, not HPPA.  This really isn't open for
debate anymore.  So we either need aliases written into autoconf scripts,
and possibly might need other changes to binutils and egcs.  Comments on
how to do this from Cygnus would be appreciated.

4. The bootloader.

We need to get more into making the bootloader interactive, and cleaning
up the source a bit.

5. Fixing the cross compiler packaging.

This is another easy one.  The current binary rpms are somewhat broken in
where they leave files, so that really needs to be redone.  Justin's got
some debian packages for those of you inclined that way.

So, step right up...

- Alex
-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
