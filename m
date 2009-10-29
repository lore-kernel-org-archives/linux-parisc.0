From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 09:20:31 -0400
Message-ID: <119aab440910290620y349f48bbme809670c6a603186@mail.gmail.com>
References: <20091027231909.74AEF4E0B@hiauly1.hia.nrc.ca>
	 <4AE8BABC.80108@gmx.de> <4AE8BEE3.1040706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org, randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE8BEE3.1040706@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 28, 2009 at 6:00 PM, Helge Deller <deller@gmx.de> wrote:
> I see a those options:
> a) drop the second (weak) unwind info entry
> b) for the weak function, use the same start- and end-addresses as the
> non-weak entry.
>
> Option b) would probably need some adjustments to the existing parisc
> specific unwind function.

FWIW I think option (a) is the best option.

Yes, the linker doesn't even consider the weak function when building
the final executable, I don't know why an unwind entry is kept for it.

Be aware that --gc-sections can cause similar problems in unwind
information on other targets, so it might also be an issue for PARISC.

Thanks for the good work so far!

Cheers,
Carlos.
