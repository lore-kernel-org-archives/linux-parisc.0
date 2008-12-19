From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 10:25:48 -0500
Message-ID: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com>
References: <20081218004329.GB30438@bombadil.infradead.org>
	 <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
	 <20081218040400.GE30438@bombadil.infradead.org>
	 <20081218182825.GA1827@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218182825.GA1827@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 18, 2008 at 1:28 PM, Kyle McMartin <kyle@infradead.org> wrote:
> On Wed, Dec 17, 2008 at 11:04:00PM -0500, Kyle McMartin wrote:
>> > There might be a problem restoring access IDs after a cache purge or
>> > TLB insertion.
>> >
>>
>> I honestly have no idea how the protection id registers are loaded... I
>> thought it had something do with with space registers, but I can't
>> remember off the top of my head.
>
> For future reference, in mmu_context.h. Bloody tricky mtctl() macro
> doesn't take a prefix, just the numeric cr #.

Evil.

Helge,

Can you cleanup your patch and resubmit. I think your patch is a good
belt-and-suspenders patch. The kernel should not fault on a protection
id trap taken while writing to a userspace address (even if such a
scenario indicates a possible bug in the mm context switching code).

Cheers,
Carlos.
