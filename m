Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Message-Id: <200310131857.h9DIvKqS029380@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] flush_tlb_all_local:
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 13 Oct 2003 14:57:19 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: soete.joel@tiscali.be, parisc-linux@parisc-linux.org
In-Reply-To: <20031013041448.GD2467@colo.lackof.org> from "Grant Grundler" at Oct 12, 2003 10:14:48 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Sun, Oct 12, 2003 at 09:12:58PM -0600, Grant Grundler wrote:
> > On Sun, Oct 12, 2003 at 04:07:50PM +0000, Joel Soete wrote:
> > > Why twice 'mtctl   %r0, %cr17'?
> > 
> > Good question. No clue. Looks like a brain fart since clearing it
> >  once should work unless there's a weird bug. I'll remove it.
> 
> definitely not a brainfart. Read PA2.0 arch book (section 2) where
> it talks about cr17/cr18. CR17 is two registers and writing it twice
> clear both head/tail of the IIAS. Just like cr18 is also written twice.

Probably, there should be a comment in the code noting this special
behavior.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
