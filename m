From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Out of order unwind entry warning
Date: Mon, 26 Oct 2009 22:24:51 -0400
Message-ID: <20091027022451.GT11702@bombadil.infradead.org>
References: <4AE620E0.9040809@gmx.de> <20091026234125.GS11702@bombadil.infradead.org> <4AE651DF.1060009@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE651DF.1060009@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 27, 2009 at 09:50:23AM +0800, Randolph Chung wrote:
>> Looks like you did some good sleuthing... Although... I notice that
>> ia64 doesn't seem to bother to do this sanity check on the unwind table.
>>
>> tausq, should we just drop it in ours too? I can't see any evidence ia64
>> does anything differently in bfd that would circumvent this kind of
>> issue.
>
> IIRC we do a binary search for the unwind entry. If the entries are not  
> sorted, the binary search will give wrong results.
>

Indeed, would be interesting to add this sanity check to ia64 and see
what happens.

regards, Kyle
