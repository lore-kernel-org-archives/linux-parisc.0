From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Wed, 5 Aug 2009 17:27:26 -0400 (EDT)
Message-ID: <20090805212727.133424CFD@hiauly1.hia.nrc.ca>
References: <20090805201456.GR28572@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090805201456.GR28572@bombadil.infradead.org> from "Kyle McMartin" at Aug 5, 2009 04:14:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > First things first, you need to agree on a single tree ... although it's
> > perfectly possible to have multiple maintainers commit to it (x86 works
> > this way), can we do this at least before the schizophrenia gets
> > noticed?
> > 
> 
> I think Helge was just upset that I wasn't merging things fast enough,
> and, fair enough, I guess. I promise to rectify that, and if I don't, I
> plan to step aside.

I agree with James.  Kyle, your support is crucial, but you don't have
to carry the full burden.  A single tree that is updated regularly makes
it easy for all maintainers to commit to, and for everone to test the
changes in the tree that haven't been pushed upstream.

I'm also pushing for stable parisc trees as well if there are enough relevant
changes to make this useful.

I know GCC's procedure are different, but it has a single master tree
with several hundred maintainers.  A maintainer has either global commit,
partial commit, or commit after approval priviledge.  There is a
test requirement for all changes, and all changes have to been sent to
the relevant lists.  Sometimes things break as a result of a change,
but not that often.

I think all the parisc maintainers should be able to push changes
upstream, but the list should be notified when this is done.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
