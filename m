Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.48.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 427684829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 16:05:11 -0700 (MST)
Date: Thu, 26 Dec 2002 18:05:03 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dynamic loader ignores DT_INIT_ARRAY and DT_FINI_ARRAY
Message-ID: <20021226230503.GA8363@systemhalted>
References: <200212262106.gBQL6RGB000567@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212262106.gBQL6RGB000567@hiauly1.hia.nrc.ca>
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

> Experimenting with initializers and finalizers, I find that the dynamic
> loader doesn't run initializers in .init_array.  The linker sets up
> DT_INIT_ARRAY to point to the list of initilizers .init_array but they
> don't get run.  This appears to be a violation of the generic System V
> ABI for ELF <http://www.caldera.com/developers/gabi/latest/contents.html>.

Do you have a quick snip of code that shows this? I'm looking through
the glibc ld bits to determine where the mistake might reside.

I'm also building latest toolchain :)

c.
