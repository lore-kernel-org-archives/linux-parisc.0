Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14043
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:13:27 -0700
Date: Mon, 15 Nov 1999 08:52:05 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] real mode stuff.
Message-Id: <19991115085205.D30917@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911142338080.7516-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911142338080.7516-100000@vodka.thepuffingroup.com>
List-ID: <linux-parisc.vger.kernel.org>

> - Philipp and I agree that we should just create arch/parisc/kernel/real
> for all the real mode stuff

Just to clarify, the directory we're talking about "arch/parisc/real" here,
not about a subdirectory of "arch/parisc/kernel".

> - creating arch/parisc/real/pdc.c

this one I'm not sure about.

arch/parisc/kernel/pdc.c and arch/parisc/real/pdc.c can be identical except
for the definition of "pdc_wrapper", and keeping an exact copy of code might
not be a good idea.

OTOH, it is extremely unlikely this code will have "real" bugs, so this is
probably less of a crime than using symlinks, #including C files, mutating
the main part of pdc.c into a header file or similar workarounds were.

> - moving some stuff in arch/parisc/kernel/realmode_setup.c to
> arch/parisc/real/setup.c or similiar.

All code in arch/parisc/real will be run in real-mode (with the exception of
some glue code to be called out of / return to protected mode).

All code run in real-mode will be in arch/parisc/real (with the temporary
exception of the _gsc_(read|write)[bwl] functions which currently disable data
translation for one or two instructions because I don't feel confident enough
to map the I/O space (which can do bad things if you write to it) into kernel
virtual memory (i.e. the memory wild pointers will refer to) just yet).

We are not just going to move "some stuff" to arch/parisc/real (and I do not
think this is what Alex said), we are going to move all real-mode code there.

	Philipp Rumpf
