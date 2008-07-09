From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Wed, 9 Jul 2008 16:55:11 -0400 (EDT)
Message-ID: <20080709205511.9BC204E4A@hiauly1.hia.nrc.ca>
References: <119aab440807091322m3e76510bg6569f12ded12fac1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, linux-parisc@vger.kernel.org,
	tausq@parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807091322m3e76510bg6569f12ded12fac1@mail.gmail.com> from "Carlos O'Donell" at Jul 9, 2008 04:22:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Jul 9, 2008 at 3:50 PM, Helge Deller <deller@gmx.de> wrote:
> > So, I still think it would be better to remove the .align16, or
> > alternatively to move it in front of ENTRY(lws_lock_start) [to be on the
> > safe side].
> >
> > Am I really that wrong?
> 
> No, you are absolutely right. I forgot the locks are referenced via
> lws_lock_start, and the symbol needs to be aligned. Sorry, I thought
> there was another symbol elsewhere.

This would be clearer if there was an ENTRY_ALIGNED macro (e.g.,
ENTRY_ALIGNED(lws_lock_start, 16)).  It's probably overkill though.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
