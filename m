Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA15469
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 11:12:37 -0700
Message-Id: <199911171812.NAA17052@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 17 Nov 1999 13:12:45 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@cygnus.com, bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19991117073453.I750@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 17, 99 07:34:53 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > Yea, but you appear to be depending on highly suspicious behavior.    The
> > trick of ordering subspaces in the first .o on the link line to provide an
> > ordering for the subspaces in the final executable relies on documented
> > behavior of the HP linker.
> 
> After reading the whole discussion, I have to admit I really don't understand
> what the problem is.  Maybe the boot loader doesn't tell us where the kernel
> ends, but do we really want to know ?  We know that everything after the start
> of the BSS section is our memory, and no-one is going to expect any nonzero
> value beyond it.

The problem is the kernel can't determine how big its common data section
is and therefore where free memory should start.  There are quite a few
big structures and arrays throughout the linux code that are global and
not initiallized.  Without the trick, _end is located at the end of the
bss section.  When "theend" is linked in, _end moves to the end of
unitialized common data and the kernel can easily determine where free
memory starts.

The current hack to determine the start of free memory is to use a symbol
that is near the end of the common data and add a fudge amount to it.
This failed for me recently when I built a configuration without network
support and the symbol was no longer defined.  The size of the common
data varies depending on kernel configuration as well.

Uninitialized common data can be avoided by using static or explicitly
initializing the data object (puts data into $DATA$ instead of $DLT$).
However, if you explicitly initialize, the size of the kernel will grow.
I know some systems still allow installation from floppies.  The kernel
might get too big for this if all common data were explicitly initialized.

Memory from the start of the bss section to the end of the common data
should be zeroed.  I presume other free memory will be initialized when
it is used.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
