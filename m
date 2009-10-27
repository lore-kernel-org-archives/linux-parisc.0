From: Randolph Chung <randolph@tausq.org>
Subject: Re: Out of order unwind entry warning
Date: Tue, 27 Oct 2009 09:50:23 +0800
Message-ID: <4AE651DF.1060009@tausq.org>
References: <4AE620E0.9040809@gmx.de> <20091026234125.GS11702@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091026234125.GS11702@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Looks like you did some good sleuthing... Although... I notice that
> ia64 doesn't seem to bother to do this sanity check on the unwind table.
> 
> tausq, should we just drop it in ours too? I can't see any evidence ia64
> does anything differently in bfd that would circumvent this kind of
> issue.

IIRC we do a binary search for the unwind entry. If the entries are not 
sorted, the binary search will give wrong results.

randolph

