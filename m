Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 053514829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 14:49:44 -0600 (MDT)
Message-Id: <200209132049.g8DKneZ1012121@hiauly1.hia.nrc.ca>
Subject: Re: [Fwd: Re: [parisc-linux] Inline Assembly Help request]
To: joel.soete@freebel.net (Joel Soete)
Date: Fri, 13 Sep 2002 16:49:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D825B1E.3090701@freebel.net> from "Joel Soete" at Sep 13, 2002 09:39:42 pm
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

> PS: Do you have an idea how may I figure out in which registers are
> stored the two parts of a 64bits int (always contigus) or would it be
> better to work with x address (in put_user_asm("stw",x,ptr)).

There is no hard and fast rule.  The treatment used by GCC is defined
in HARD_REGNO_MODE_OK in pa32-regs.h.  Currently we used consecutive
pairs of registers.  This may be subject to change though.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
