From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Wed, 16 Dec 2009 16:35:04 -0500 (EST)
Message-ID: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
References: <4B294F8B.1070700@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	James.Bottomley@hansenpartnership.com
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B294F8B.1070700@gmx.de> from "Helge Deller" at Dec 16, 2009 10:22:19 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 12/15/2009 11:21 PM, John David Anglin wrote:
> >> I have constructed a vfork test case which shows some of the problems
> >> I have using vfork reliably. This fails every time on my PA8700 system
> >> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
> >> being corrupted.
> >
> > The test doesn't fail on two of my builds:
> > Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
> > Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc
> 
> I did tested your testcase on my c3000 too but it didn't failed for me either.
> This was on some 2.6.32-rc candidate.

I think it must be because Carlos is building SMP kernels.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
