From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 7 Jul 2009 10:07:32 -0400
Message-ID: <119aab440907070707u5cbf0de7j60fb80cef470f216@mail.gmail.com>
References: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca>
	 <4A52BBE2.7020507@tausq.org>
	 <20090707044214.GB3826@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Randolph Chung <randolph@tausq.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707044214.GB3826@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 7, 2009 at 12:42 AM, Kyle McMartin<kyle@mcmartin.ca> wrote:
> indeed, it very briefly had a dwarf unwinder, but linus turned it off
> again because it turned out to generate worse backtraces than just
> chunking through stack frames with frame pointers enabled did. although,
> there is talk of it growing one again now.

It will definitely need to grow a dwarf2 unwinder.

Any sane ABI should drop the hard frame pointer requirement in order
to get better code generation. For example on ARM under the EABI there
is no hard fp, you get that register back for other uses and it
simplifies prologue and epilogues. If you need an offset from the fp
the compiler synthesizes it for you, and reuses it appropriately after
the use is dead.

I thought bfd, and therefore readelf and objdump could read parisc
unwind info, if so, then what do those tools say about this broken
unwind info?

c.
