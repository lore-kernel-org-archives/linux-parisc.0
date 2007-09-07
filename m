From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri, 7 Sep 2007 12:50:25 -0400 (EDT)
Message-ID: <200709071650.l87GoPTZ020957__36641.6689860218$1416624437$gmane$org@hiauly1.hia.nrc.ca>
References: <46E1808B.20301@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: matthew@wil.cx,
 kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org,
 deller@gmx.de
To: soete.joel@scarlet.be (Joel Soete)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <46E1808B.20301@scarlet.be> from "Joel Soete" at Sep 7, 2007 04:47:07 pm
List-ID: <linux-parisc.vger.kernel.org>

> Matthew Wilcox wrote:
> > On Wed, Sep 05, 2007 at 03:51:22PM +0000, Joel Soete wrote:
> >> mmm and what do you think about adding yet another format letter e.g. [rR] for resource_size_t as it was done for [zZ]?
> > 
> > You'd also have to teach gcc about it.
> > 
> What should I teach to gcc?

Don't try, it's a waste of effort.  Just do the cast to unsigned long long
as previously suggested.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
