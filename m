Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1D67484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  7 Feb 2004 17:00:12 -0700 (MST)
Message-Id: <200402080000.i18009hb006432@hiauly1.hia.nrc.ca>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sat, 7 Feb 2004 19:00:09 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040131222832.GB19840@baldric.uwo.ca> from "Carlos O'Donell" at
	Jan 31, 2004 05:28:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> The following patch is required in gcc to add another byte check for the
> new TRAMPOLINE_TEMPLATE that has profile fixes added in glibc 2.3.2.
> I've added comments in glibc to indicate that TRAMPOLINE_TEMPLATE
> changes are bad things to do. AFAIK this is the last change *ever* since
> we now have working profile support :)
> 
> I'm not quite sure what the "-4" is intended to accomplish, I figure I
> could have prefixed the TREAMPOLINE_TEMPLATE with another jump that
> gives the right address? That still makes for an extra jump, and I'd
> rather have gcc just look in the right place first.
> 
> Thoughts on this?

I'm just back from Japan and still somewhat jet lagged.

The change to the TRAMPOLINE_TEMPLATE macro introduces an ABI change.
In spite of the extra overhead, I think it would be better to do it
in a way that didn't require a libgcc.a update.  We only do a call
to fixup when a function pointer hasn't been resolved, so the extra
overhead in using "-4" isn't huge.

If we use the "-4" feature, I can reverse the search order in fptr.c
so that the offset at "-4" is searched first.  This also allows arbitrary
changes to the code in the rest of the template.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
