Return-Path: <carlos@baldric.uwo.ca>
Received: from fep03-mail.bloor.is.net.cable.rogers.com
	(fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EC63484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  7 Feb 2004 18:46:31 -0700 (MST)
Date: Sat, 7 Feb 2004 20:47:00 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in
Message-ID: <20040208014659.GC23095@baldric.uwo.ca>
References: <20040131222832.GB19840@baldric.uwo.ca>
	<200402080000.i18009hb006432@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200402080000.i18009hb006432@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > I'm not quite sure what the "-4" is intended to accomplish, I figure I
> > could have prefixed the TREAMPOLINE_TEMPLATE with another jump that
> > gives the right address? That still makes for an extra jump, and I'd
> > rather have gcc just look in the right place first.
> > 
> > Thoughts on this?
> 
> I'm just back from Japan and still somewhat jet lagged.

No worries!
 
> The change to the TRAMPOLINE_TEMPLATE macro introduces an ABI change.
> In spite of the extra overhead, I think it would be better to do it
> in a way that didn't require a libgcc.a update.  We only do a call
> to fixup when a function pointer hasn't been resolved, so the extra
> overhead in using "-4" isn't huge.

How do we break ABI? How are those templates part of any ABI? If they
weren't written in ASM they'd be changing all the time (except the entry
point symbol).

An alternative is to split into two templates, one for profiling and one
for non-profiling. This would mean that the original _dl_runtime_resolve
function looks the same, while the following template is bigger.

> If we use the "-4" feature, I can reverse the search order in fptr.c
> so that the offset at "-4" is searched first.  This also allows arbitrary
> changes to the code in the rest of the template.

The only reason I wanted to change __cffc was so the bl was found on the
first loop. I later changed the glibc to include the same bl at "-4"
before the function. The "32" must remain for old applications, the "-4"
will work for new applications once that patches go into debian's glibc
(after a round of public testing).

Perhaps I'll let you catch up on all the mail I sent you :)

c.
