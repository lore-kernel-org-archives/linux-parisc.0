Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA20413
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 02:27:37 -0700
Received: from proxy.ats.nld.alcatel.nl (proxy.ats.nld.alcatel.nl [138.203.176.252])
	by btmplq.god.bel.alcatel.be (8.9.3+Sun/8.9.1) with ESMTP id LAA24568
	for <parisc-linux@thepuffingroup.com>; Tue, 28 Mar 2000 11:27:19 +0200 (MET DST)
Received: from nlsols1.ats.nld.alcatel.nl (nlsolnfs [138.203.176.15])
	by proxy.ats.nld.alcatel.nl (8.8.8/8.8.8) with ESMTP id LAA09070
	for <parisc-linux@thepuffingroup.com>; Tue, 28 Mar 2000 11:23:59 +0200 (MET DST)
Received: from ats.nld.alcatel.nl (beerse@nlhw02 [138.203.176.72])
	by nlsols1.ats.nld.alcatel.nl (8.9.1/8.9.1) with ESMTP id LAA15196
	for <parisc-linux@thepuffingroup.com>; Tue, 28 Mar 2000 11:20:39 +0200 (MET DST)
Sender: beerse@ats.nld.alcatel.nl
Message-ID: <38E07967.D33FED14@ats.nld.alcatel.nl>
Date: Tue, 28 Mar 2000 11:20:39 +0200
From: Corne Beerse <beerse@ats.nld.alcatel.nl>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Couple of questions
References: <852568AF.00513999.00@tormta3.tor.cel.com> <20000327110201.A10222@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > Just a slight clarification on what TOC does. Although on the surface the
> > Transfer-Of-Control button/switch merely appears to result in a system
> > reset, its primary use is to recover from system hang conditions while
> > preserving the machine state for later analysis, i.e. where and why was
> > the sytem hung.
> >
> > So, in summary, although TOC on the surface appears to merely 'reset' the
> > system, it is capable of much more provided the OS specifies an OS_TOC
> > entry point for recovery and debug of machine state at any point during
> > system run time.
> 
> Actually, that's exactly what reset does on (most) x86 boxes.  Remember
> getting 286s out of protected mode by resetting them ?
> 
> I'm not convinced having customized TOC / HPMC handlers for Linux/PA-RISC
> is a good idea yet.
> 
As I read this, the TOC button can have the next implementations:
- hardware reset, as the button on intel platforms
- three finger salute (<ctrl><alt><del>) as on intel platforms
- Boot prom prompt (if available, like Sun's <Stop><A>)
- Kernel core dump and [stop|halt|reboot|continue|shutdown]
- What does HPUX with it?
a combination of the above.

The main reason for this button is a kernel debugging aid. Not that I'm a
kernel hacker, I follow this group out of interest.

BTW, Where can I find this TOC button on my 9000/712/60 machine? is it the
white button on the front? If so, please give some software control to it.
In the past, I frequently pushed my keyboard against it, rebooting the
machine while typing......

CB

-- 
Everything should be as simple as possible but not simpler - A. Einstein
Corne' Beerse					| Alcatel Telecom Nederland
mailto:beerse@ats.nld.alcatel.nl		| Postbus 3292
talkto:+31(70)3079108 faxto:+31(70)3079191	| NL-2280 GG  Rijswijk
