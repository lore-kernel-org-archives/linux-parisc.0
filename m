Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA01312
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 14:17:16 -0700
Message-ID: <E97137CF9A25D311902E00A0C9F484E0027985F3@xfc03.fc.hp.com>
From: "HOLBROOK,SCOTT \(HP-FtCollins,ex1\)" <scott_holbrook@am.exch.hp.com>
To: "'willy@thepuffingroup.com'" <willy@thepuffingroup.com>,
        "'Grant Grundler'" <grundler@cup.hp.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] code 28 trap
Date: Fri, 25 Feb 2000 12:17:51 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Willy wrote:

> Uh oh.  We really need a kernel unaligned trap handler.  Some of
> the network protocols rely on that being handled right (yes, I know.
> it sucks.)  I was about to say `I really don't think this applies to
> IP or BOOTP/IP', when I remembered...
> 
> http://boudicca.tux.org/hypermail/linux-kernel/2000week06/0092.html
> 
> There was a bug in 2.3.41, looks like it didn't get fixed in .42, that
> caused things to get unaligned once in a while.  Doh!  Anyone want to
> volunteer to write an unaligned trap handler...?

Years ago I wrote an unaligned load/store emulator (trap handler) for a
port of an evil OS to PA-RISC.  I still have the code -- it would take
a little bit of work to massage it into a real low-level trap handler,
but that task should be very straight-forward.

The code handles both integer and FP loads/stores.  It was written before
the 2.0 architecture, so it definitely needs a little work to recognize and
emulate some of the new 2.0 opcodes (like 64-bit loads/stores, etc).  It
also expects the registers to be saved in a format that is, I'm sure, a
bit different from the Linux save state.  The code is designed to run
in virtual mode, so the "trap 28" handler would have to save all registers,
turn the Q-bit back on and then call the emulation code.  This is somewhat
expensive, but doing it more efficiently is much more complicated (near to
impossible on MP systems).  The problem with doing the emulation directly
in the trap handler (with the Q-bit off) is that its possible for your loads
or stores to cause another page fault (especially if they cross a page
boundary).
PA-RISC doesn't allow "nested" traps.  MP issues make things worse (TLB
entries
can disappear out from under you, etc).

However, emulating unaligned loads/stores is generally NOT a good idea.  The
problem is that there is no way to do the unaligned load/store atomically.
This, of course, can cause big problems in an MP environment depending on
what the code is trying to do.  Its possible to fix the atomicity issue, as
long as all accesses to the data will be unaligned (so that they all have to
go through the trap handler), but this may be overkill.  What have other
architectures (like Alpha) done?

For this networking problem, MP atomicity is probably not an issue.
However,
we should really drive to have the problem fixed.

I'm a little short on time right now, but I'd be glad to give what I've got
to
someone and provide some consulting on how it works/how it needs to be
changed.

Scott Holbrook / rsh@fc.hp.com
