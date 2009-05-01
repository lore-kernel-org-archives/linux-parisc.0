From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 18:55:00 -0400 (EDT)
Message-ID: <20090501225500.7F7134FB2@hiauly1.hia.nrc.ca>
References: <20090501223940.GA10501@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, kyle@mcmartin.ca,
	dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org, deller@gmx.de,
	linux-parisc@vger.kernel.org, varenet@debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090501223940.GA10501@bombadil.infradead.org> from "Kyle McMartin" at May 1, 2009 06:39:40 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I guess... I don't understand the gcc clobber semantics on asm()
> anymore, I'm just thinking of that stupid bug with ip_fast_csum we saw
> on parisc a few years ago...

These are in fact subtle and complex.  There were two or three bugs
that appeared in the transition to 4.4.0 as a result of the change
to the new register allocator.  In paricular, using clobbers of hard
registers in call patterns caused a number of problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
