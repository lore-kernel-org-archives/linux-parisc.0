From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Tue, 16 Mar 2010 07:49:18 -0400
Message-ID: <119aab441003160449n11cf5272qb9d15fa97625dd7d@mail.gmail.com>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca>
	 <20100307203230.CAC964E77@hiauly1.hia.nrc.ca>
	 <20100311032049.GA14312@hiauly1.hia.nrc.ca>
	 <20100311135418.GA22698@bombadil.infradead.org>
	 <20100311224044.GA18789@hiauly1.hia.nrc.ca>
	 <20100313020647.GA26384@hiauly1.hia.nrc.ca>
	 <20100315011024.GA7309@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100315011024.GA7309@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 14, 2010 at 9:10 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Fri, 12 Mar 2010, John David Anglin wrote:
>
>> The other issue is r16. =A0I'm thinking we may need to reload r16 as=
 the
>> context may change if we schedule, etc. =A0If this checking is broke=
n, it
>> would break the LWS assumptions.
>
> This theory is shotdown. =A0The patch below possibly helps a bit but =
it
> doesn't resolve the minifail bug. =A0The intention of the last couple=
 of
> hunks is to return to the right place if cr30 changes as a result of
> scheduling.

Thanks for testing this out.

> With more debugging, it seems that this is a clone mmap copy issue.
> Normally, the forked child doesn't see any non-zero data in the
> stack region allocated by pthread_create. =A0However, if it does,
> the thread invariably dies and the stack region is corrupt after
> the fork.
>
> I guess I said this before ;(

After some of my own testing I think this is all MMU related, but I
can't prove it yet. I'm pouring through as much kernel code as I can
right now to determine what is going wrong at the time of the clone,
and I see at least one bug that I'm investigating regarding return
addresses.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
