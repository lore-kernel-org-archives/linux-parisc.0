Return-Path: <carlos@baldric.uwo.ca>
Received: from fep03-mail.bloor.is.net.cable.rogers.com
	(fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 642384843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 23:56:57 -0700 (MST)
Date: Sat, 31 Jan 2004 01:57:20 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20040131065719.GW19840@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] canonicalize_funcptr_for_compare,
	needs some thinking about...
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


jda,

On a hint from Randolph I decided to look at how cffc works in gcc.
Did I get a big whallop. I didn't mention that I'd modified our
TRAMPOLINE_TEMPLATE, because we weren't correclty passing profile_fixup
the return pointer. Then I realized that cffc magically grok'd the byte
offset into the template to get the jump right :)

I'm going to update the clever list of offsets to check, thanks for
doing that, great for backwards compatibility! Once updated, I'll
recompile gcc, and try another round at the tests.

c.
