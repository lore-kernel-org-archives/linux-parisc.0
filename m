Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA08866
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 07:54:44 -0700
From: davisg@Celestica.com
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
cc: Bas Valkema <b_valkema@hotmail.com>, parisc-linux@thepuffingroup.com
Message-ID: <852568AF.00513999.00@tormta3.tor.cel.com>
Date: Mon, 27 Mar 2000 09:43:28 -0500
Subject: Re: [parisc-linux] Couple of questions
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Greetings,

Just a slight clarification on what TOC does. Although on the surface the
Transfer-Of-Control
button/switch merely appears to result in a system reset, its primary use is to
recover from
system hang conditions while preserving the machine state for later analysis,
i.e. where and
why was the sytem hung.

The TOC switch invokes the platform firmware PDCE_TOC entry point to save
machine state
to non-valitile storage (PIM TOC) after which the firmware checks MEM_TOC to
determine if
the operating system has identified an entry point to be called for recovery. If
an OS_TOC entry
point has been specified (by the OS), the platform firmware transfers control to
the specified
OS procedure. Typically, the OS_TOC entry point calls PDC_PIM to retrieve the
machine
state for display of a tomb stone marker, syncs/flushes all disk buffers,
performs a core dump
and then resets the system (not necessarily in the order specified here). One
could invoke a
debugger at any point in here to have a look around to see what was going on at
the time of
TOC.

The above information is all contained in the "PA-RISC x.x Firmware Architecture
Reference
Specification" documents available at
http://www.thepuffinegroup.com/parisc/documentation.html.

So, in summary, although TOC on the surface appears to merely 'reset' the
system, it is capable
of much more provided the OS specifies an OS_TOC entry point for recovery and
debug of
machine state at any point during system run time.


Regards,
Geoge G. Davis
Software Engineer,  Celestica Chelmsford Design Center
20 Alpha Road
Chelmsford, MA 01824





Philipp Rumpf <prumpf@puffin.external.hp.com> on 03/26/2000 01:02:15 PM

To:   Bas Valkema <b_valkema@hotmail.com>, parisc-linux@thepuffingroup.com
cc:    (bcc: George G Davis/CCH/Celestica)

Subject:  Re: [parisc-linux] Couple of questions



> 1 - how does a 715/50 boot over a network? Probably not bootp...

rboot.  there's an RPM for it on puffin.external.hp.com.

> 3 - What does the TOC button do????

Reset, usually.

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
