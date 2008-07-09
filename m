From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Wed, 9 Jul 2008 16:22:04 -0400
Message-ID: <119aab440807091322m3e76510bg6569f12ded12fac1@mail.gmail.com>
References: <200807082206.36288.deller@gmx.de>
	 <119aab440807090514o282301a9g6ef05149dbca3efb@mail.gmail.com>
	 <487516A0.6090601@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Kyle McMartin" <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Randolph Chung" <tausq@parisc-linux.org>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <487516A0.6090601@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 9, 2008 at 3:50 PM, Helge Deller <deller@gmx.de> wrote:
> So, I still think it would be better to remove the .align16, or
> alternatively to move it in front of ENTRY(lws_lock_start) [to be on the
> safe side].
>
> Am I really that wrong?

No, you are absolutely right. I forgot the locks are referenced via
lws_lock_start, and the symbol needs to be aligned. Sorry, I thought
there was another symbol elsewhere.

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

Cheers,
Carlos.
