Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA18748
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Aug 1999 12:33:42 -0600
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] 'architected'? 
In-reply-to: Your message of "Tue, 17 Aug 1999 17:06:38 EDT."
             <37B9CEDE.9F09087E@thepuffingroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 18 Aug 1999 12:34:58 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990818183458.A35A818708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> So, I've been rereading some docs lately, and am wondering what
> 'architected' really is.  

> Here's an example, dug up by Dave Kennedy.  This is on page 3, under the
> heading '2. PDC Procedures' in pdc.pdf:

> "The architected operation of a module (including execution of a PDC)
> must not require the use of any non-architected PDC procedures.  It must
> also not require the use of any non-architected options in architected
> PDC produces."

I don't have the documents in front of me, so forgive me if I get a name
or 6 wrong...  The PDC Procedures Document (and anything with the same
cover page, such as the Generic Modules Document) comprise what used to
be called the "Architecture Control Document."  An "architected" thing
is discussed in those documents, un-architected things generally are not.
Just to make matters interesting, you will see mention in the documents
to SV (software version specific), and HV (hardware version specific)
features.

The paragraph you cite indicates that hardware (modules) cannot require
that an OS author perform HV PDC (arg0>=128) calls (or other funky stuff
like DIAG instructions, or poking magic addresses not spelled out in the
architecture document) in order to use the hardware in the system.  In
this case, "use" pretty much means anything that generic OS software
needs to do with the module to initialize it.  In other words, the bus
walk.

Sadly, certain hardware is not quite compliant with the architecture, in
that it violates the very paragraph you cite.  Most notably (from our
recent discussions), the bus walk of the 7[235]0 requires magic knowledge
of where things are and how to poke them nicely.

Does that help any?
lamont
