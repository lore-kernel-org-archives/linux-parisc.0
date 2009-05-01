From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 13:14:08 -0400 (EDT)
Message-ID: <20090501171409.601AF4E9F@hiauly1.hia.nrc.ca>
References: <20090501014714.7804E4FC4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org,
	varenet@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090501014714.7804E4FC4@hiauly1.hia.nrc.ca> from "John David Anglin" at Apr 30, 2009 09:47:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > On Thu, Apr 30, 2009 at 11:39:45PM +0200, Helge Deller wrote:
> > > This "fix ldcw assembler" patch below is really an old one now, but sadly it never got applied.
> > > 
> > > I just tried it again. Without this patch I always see login-problems when ssh-ing into
> > > my parisc box. The very first time sshd just drops the connection (Connection closed by remote host).
> > > With this patch I didn't faced this problem again.
> > > 
> > > I'm wondering, if not other userspace problems suddenly go away then as well,
> > > e.g. the uid/gid issues others are seeing:
> > > http://marc.info/?l=linux-parisc&m=121114269417948&w=2
> > > 
> > > Kyle, please apply.
> > > 
> > 
> > gotcha.
> 
> Kyle, can you try and push it into 2.6.30?  It fixes a major security hole.
> 
> I've tried it with 2.6.30-rc4 on my c3750 and agree with Helge that it
> fixes the ssh bug that I had on this machine.

Sorry, I should not have pushed for 2.6.30.  The ssh bug is still present
on my c3750.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
