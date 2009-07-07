From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 07 Jul 2009 20:02:43 +0200
Message-ID: <4A538DC3.5070107@gmx.de>
References: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca>	 <4A52BBE2.7020507@tausq.org>	 <20090707044214.GB3826@bombadil.infradead.org> <119aab440907070707u5cbf0de7j60fb80cef470f216@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907070707u5cbf0de7j60fb80cef470f216@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/07/2009 04:07 PM, Carlos O'Donell wrote:
> On Tue, Jul 7, 2009 at 12:42 AM, Kyle McMartin<kyle@mcmartin.ca>  wrote:
>> indeed, it very briefly had a dwarf unwinder, but linus turned it off
>> again because it turned out to generate worse backtraces than just
>> chunking through stack frames with frame pointers enabled did. although,
>> there is talk of it growing one again now.
>
> It will definitely need to grow a dwarf2 unwinder.
>
> Any sane ABI should drop the hard frame pointer requirement in order
> to get better code generation. For example on ARM under the EABI there
> is no hard fp, you get that register back for other uses and it
> simplifies prologue and epilogues. If you need an offset from the fp
> the compiler synthesizes it for you, and reuses it appropriately after
> the use is dead.
>
> I thought bfd, and therefore readelf and objdump could read parisc
> unwind info, if so, then what do those tools say about this broken
> unwind info?

Any hint what I should do to give you the input you need?

Helge
