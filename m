Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA11832
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 11:04:16 -0700
Message-ID: <20000327110201.A10222@puffin.external.hp.com>
Date: Mon, 27 Mar 2000 11:02:01 -0700
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: davisg@Celestica.com
Cc: Bas Valkema <b_valkema@hotmail.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Couple of questions
References: <852568AF.00513999.00@tormta3.tor.cel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <852568AF.00513999.00@tormta3.tor.cel.com>; from davisg@Celestica.com on Mon, Mar 27, 2000 at 09:43:28AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> Just a slight clarification on what TOC does. Although on the surface the
> Transfer-Of-Control button/switch merely appears to result in a system
> reset, its primary use is to recover from system hang conditions while
> preserving the machine state for later analysis, i.e. where and why was
> the sytem hung.
> 
> So, in summary, although TOC on the surface appears to merely 'reset' the
> system, it is capable of much more provided the OS specifies an OS_TOC
> entry point for recovery and debug of machine state at any point during
> system run time.

Actually, that's exactly what reset does on (most) x86 boxes.  Remember
getting 286s out of protected mode by resetting them ?

I'm not convinced having customized TOC / HPMC handlers for Linux/PA-RISC
is a good idea yet.

	Philipp Rumpf
