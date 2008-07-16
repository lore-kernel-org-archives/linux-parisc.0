From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] Document LWS ABI.
Date: Tue, 15 Jul 2008 20:54:24 -0400
Message-ID: <119aab440807151754r376e339eoe5e496f4642de4df@mail.gmail.com>
References: <119aab440807151251m7d00ca82gde10474cb35e8430@mail.gmail.com>
	 <20080716001514.74D5F431A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: deller@gmx.de, kyle@mcmartin.ca, dave.anglin@nrc.ca,
	linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080716001514.74D5F431A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 15, 2008 at 8:15 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > Sure. I thought the discussion was about adding a 64-bit runtime entry point
>> > which operates on a 64-bit pointer. But this can be done discussed when
>> > 64-bit userspace is coming...
>>
>> The entry point is already there. It's LWS #1. Apparnetly I created it
>> with a 64-bit userspace in mind.
>
> You didn't respond to the issue.

It doesn't work for the 64-bit runtime, I only used stw/ldw, and it
should be std/ldd. Which operation depends on the width of userspace,
so in all likelyhood I have to just duplicate the code. No real
problem there.

>> Please apply the patch and send it upstream?
>
> This ABI change is unjustified and I won't approve the Helge's GCC patch
> with this change.  You will also have to change the glibc code to match.
>
> Kyle indicated that he didn't want any major changes to the LWS interface,
> so reserving several new registers is unnecessary.

All I have done is clarify the intended interface. There has been no
actual change from what is already implemented. The glibc code already
matches this interface.

The question is "Are you OK with the existing ABI?" :-)

Cheers,
Carlos.
