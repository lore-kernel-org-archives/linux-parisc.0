Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 147C94829
	for <parisc-linux@parisc-linux.org>; Thu,  6 Feb 2003 15:21:36 -0700 (MST)
Message-Id: <200302062221.h16MLXHD010590@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiler switches
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Thu, 6 Feb 2003 17:21:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <200302022202.h12M2InV026338@hiauly1.hia.nrc.ca> from "John David Anglin" at Feb 2, 2003 05:02:18 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > I think they definitely should be implied by configuring for hppa-linux.
> > I don't see any enthusiasm for allowing use of additional space registers
> > for special purposes.
> 
> Ok, I will do some testing with fast indirect and no space registers.

I have installed a GCC patch on 3.3 and trunk that changes the
hppa-unknown-linux-gnu target (no change to hppa64-unknown-linux-gnu) to
include MASK_NO_SPACE_REGISTERS in the target default.  The patch also
improves the code generated in a few situations where we unnecessarily
loaded the destination space register when doing an external branch.
As these were in rather uncommon situations, I doubt anyone will see
much difference in performance.  This really only affects PA 1.x as
PA 2.0 has the "bve" insn which sets the space register automatically.

It's not a good idea to make fast indirect the default.  Fast indirect
calls only work when a program has static linkage (i.e., the're not
compatible with shared libraries because the PIC register is not set
when you do a fast indirect call).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
