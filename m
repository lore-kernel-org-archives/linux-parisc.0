From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Sun, 12 Dec 2010 15:22:59 -0500
Message-ID: <20101212202258.GA9184@hiauly1.hia.nrc.ca>
References: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be> <20101212192148.079834CF3@hiauly1.hia.nrc.ca> <20101212203322.21537607@borg.bxl.tuxicoman.be>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101212203322.21537607@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 12 Dec 2010, Guy Martin wrote:

> On Sun, 12 Dec 2010 14:21:47 -0500 (EST)
> "John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
> 
> > Hmmm, I didn't think we allowed call instructions in the delay slot of
> > a branch.  Even though nullified, I think there were issues on some
> > processors.  Is an asm involved?
> 
> I forgot to say that I've been testing this on my C3600.
> What do you mean by "Is an asm involved?" ?

Internally, the PA backend keeps track of "insn" types using an attribute
mechanism.  This is what keeps calls out of the delay slot of branches, etc.

asms can do stuff that GCC doesn't know about and this can cause
wrong code issues.  I was just speculating.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
