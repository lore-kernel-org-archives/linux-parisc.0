From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 7 Jul 2009 00:42:14 -0400
Message-ID: <20090707044214.GB3826@bombadil.infradead.org>
References: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca> <4A52BBE2.7020507@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A52BBE2.7020507@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 07, 2009 at 11:07:14AM +0800, Randolph Chung wrote:
> the hppa kernel unwinder is derived from the ia64 unwinder, which is not  
> dwarf2 based.
>
> The only dwarf references I find in the kernel are some dwarf markups in  
> signal frames to help userspace with signal frame unwinding. Have I  
> missed anything?
>
> x86 seems to do something very ad-hoc.
>

indeed, it very briefly had a dwarf unwinder, but linus turned it off
again because it turned out to generate worse backtraces than just
chunking through stack frames with frame pointers enabled did. although,
there is talk of it growing one again now.

regards, kyle
