Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 2 Feb 1999 16:19:41 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
Reply-To: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Subject: Some planning issues.
Message-ID: <Pine.LNX.3.96.990202151755.12373E-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"MzbZv1.0.Ec5.CMujs"@burrow.puffingroup.com>
List-Id: linux-parisc.vger.kernel.org


Alright.  Here are some very preliminary planning idea for HPPA.  It's
hard to tell exactly how this is going to go because we haven't even seen
architecture overviews yet.

I'm writing this mostly for the people who've never been through a linux
port before; I'm borrowing heavily from my SGI experience.

Build Environment
-----------------

Generally, the way to get started with the kernel is to cross compile.
We're at an advantage because there's some sort of native builder for
mklinux; asuming this works we may just build under mklinux until we have
modern cross compilers working for target hppa-linux.

I've got binutils cross compiler already, egcs has some issues.

Boot Loader
-----------

We need to figure out how to load a kerne image; I suspect borrowing from
openbsd and mklinux will be great.


Kernel
------

Alright.  This is the hard part. This is going to involve a lot of trial
and error, particularly up until the point where you can actually get some
output.

The order of what to build should be:
- stuff in arch/hppa, which is:
  - boot strapping code (head.S)
  - MMU handling
  - signal handling
  - interrupt handling, etc
  - talking on the local bus
- some sort of network driver so we can get to root nfs
  - ethernet device driver (drivers/net)

All of this is going to be terrifically difficult without someone with
prior HPPA experience.  However, we do have OpenBSD and mklinux to model
things after. And hopefully we'll have docs.

After this is the 'easy' kernel work:
- stuff in drivers/hp/:
  - graphics
  - SCSI controller
  - keyboard
  - other devices

Userland
--------
The mklinux tree is libc5 based, IIRC.  That means we're going to have to
fix glibc 2.x to support hppa-linux.  A slight pain, but not impossible.

After this, modern distributions should build cleanly.  I'm pretty keen on
building Red Hat for hppa, and that's not only because I work for them.
We'd encourage other distributions too, I think.

Undoubtedly there'll be packages which assume that if you have an HPPA,
you must be running HP-UX.


- Alex

-- 
Alex deVries <puffin@redhat.com>
Red Hat Contrib Net maintainer
Ottawa, Canada
