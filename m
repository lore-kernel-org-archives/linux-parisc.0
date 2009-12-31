From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Thu, 31 Dec 2009 13:14:27 -0500
Message-ID: <119aab440912311014j276d8c29mc8d8b59c7c5cafd1@mail.gmail.com>
References: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca>
	 <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com>
	 <20091228185916.GA13912@hiauly1.hia.nrc.ca> <4B3A0889.7030701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B3A0889.7030701@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 29, 2009 at 8:47 AM, Helge Deller <deller@gmx.de> wrote:
>> 2) Change return space register to sr7. =A0sr3 is not set correctly
>> if the entry number is invalid.
>
> Yep.
>
>> Have nasty suspicion that sr3 is getting hit...

Is the thought here that we take an interrupt, and sr3 is not
guaranteed saved/restored, while sr7 is guaranteed?

I don't see anything wrong with moving the gate earlier (unless
someone can come up with a case where an LWS may not want to gate).

It has the benefit of making the fast path 1 instruction shorter,
however I don't see that it makes the implementation more correct.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
