Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA13731
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Sep 1999 12:32:01 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id OAA02536
	for <parisc-linux@thepuffingroup.com>; Sat, 4 Sep 1999 14:50:54 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37D16A0D.1D1A2BB0@thepuffingroup.com>
Date: Sat, 04 Sep 1999 14:50:53 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ownership of parisc-kernel code
List-ID: <linux-parisc.vger.kernel.org>


PA-RISC Linux development is going well, but some things have changed
from a few months ago.  We have more developers than ever before, and
because of that, it looks like some people are stepping on other
people's toes.

I think there's some areas in which the parisc-linux developers could do
a bit better, and a lot of it comes from the fact that there's no
understood boundaries of who owns what code.

So, I'm going to suggest that I implement the following plan.  If people
have objections or suggestions, I'd appreciate feedback in the next 24
hours.

What we'd do is document which people are owners of which chunk of the
parisc kernel code. In the end, those owners are ultimately responsible
for that chunk of code. 

How they handle incoming patches for those areas, or handle changes that
affect multiple areas is up to them. If they decide that they want to
read every little patch that goes through, great. If they want to assign
subsections to others, fine.  But they are responsible in the end.

Here's my suggested division:

Interruptions and Interrupts:  Philipp Rumpf
Virtual Memory:                Philipp Rumpf
Syscalls:                      Matthew Wilcox
IO Peripherals/inventory:      Alex deVries
Boot code:                     Helge Deller
Everything else:               Alex deVries


In the end, this division is up to me, and I'll be happy to re-assign
people, settle disputes (*sigh*), etc. So if you have a gripe about a
certain section owner not doing their job, I'm the second person you
should complain to.

There are some simple things I insist all developers abide to:

- ALL changes need to be documented properly in the CVS comments
- Significant changes discussed on the the parisc-linux mailing list
- All changes *MUST* compile and produce a bootable kernel for the
default
  configuration, unless there's prior warning[1]
- Be civil on the list.  Anyone who commits code does it because they
genuinely want parisc-linux to work, we're all in the same boat
together.

Also, another note about the mailing list: this list was intended to be
used by the developers, and there's no limit of technical depth. If you
want to mail patches, mail patches.  People who don't want this
forwarded to them will just have to deal with it.

[1] By prior warning, I mean a mail to the list that says something like
"I'm working on support for the XUAZ SCSI controller, this might break
XYZ800 support temporarily". Sometimes you need to take one step back to
go two forward.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
