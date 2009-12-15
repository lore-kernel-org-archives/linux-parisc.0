From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Tue, 15 Dec 2009 17:21:17 -0500 (EST)
Message-ID: <20091215222119.E6CD84ED7@hiauly1.hia.nrc.ca>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com> from "Carlos O'Donell" at Dec 6, 2009 04:19:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I have constructed a vfork test case which shows some of the problems
> I have using vfork reliably. This fails every time on my PA8700 system
> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
> being corrupted.

The test doesn't fail on two of my builds:
Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc

Are you running a SMP config?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
