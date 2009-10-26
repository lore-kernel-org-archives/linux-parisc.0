From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Out of order unwind entry warning
Date: Mon, 26 Oct 2009 19:41:25 -0400
Message-ID: <20091026234125.GS11702@bombadil.infradead.org>
References: <4AE620E0.9040809@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Randolph Chung <randolph@tausq.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE620E0.9040809@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 26, 2009 at 11:21:20PM +0100, Helge Deller wrote:
> I started to look into the problem why we get the
>> WARNING: Out of order unwind entry!
> warning messages at kernel bootup in dmesg.
>
> It's related to a binutils/linker bug, that ld does not correctly
> removes unlink information for unused weak symbols, which have been
> replaced by their non-weak ones.
>

Looks like you did some good sleuthing... Although... I notice that
ia64 doesn't seem to bother to do this sanity check on the unwind table.

tausq, should we just drop it in ours too? I can't see any evidence ia64
does anything differently in bfd that would circumvent this kind of
issue.

regards, Kyle
