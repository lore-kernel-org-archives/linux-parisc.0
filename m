Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E771F4857
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 31 Jan 2004 22:00:44 -0700 (MST)
Date: Sat, 31 Jan 2004 22:00:43 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] About 2.6 64bit on b2k?
Message-ID: <20040201050043.GC3730@colo.lackof.org>
References: <400CB8A1000070BA@ocpmta3.freegates.net>
	<401C4B13.3060906@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <401C4B13.3060906@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 01, 2004 at 12:40:51AM +0000, Joel Soete wrote:
> I don't understand why it works on c3k and not on b2k.
> Could it be because by b2k has only 256k of physical ram?

No. And you meant 256MB.
But c3k and b2k both supported the same DIMMs originally (128 and 256MB
DIMMS). Minimum mem possible was thus 128MB and I thought 256MB was
the minimum shipped with each box.

Sorry - I don't know why reverting that diff matters.

> Also, I notice that in head64.S there aren't .import like:
> [snip]
>         .import init_thread_union,data
>         .import $global$                /* forward declaration */
>         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
>         .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
> [snip]
> 
> as in its 32bit brother head.S

head64.S only runs wide mode on PA20 HW.
No need for any PA11 or narrow mode code.
Look in the Makefile and see when head64.o is linked in.
Then you'll *SMACK* yourself on the forehead and say "DOH!" :^)


> I don't yet find the meaning of '.import' but just in case ;)

AFAIK, it's just telling the assembler where to expect global symbols.

grant
