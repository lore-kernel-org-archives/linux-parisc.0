From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Thu, 18 Oct 2007 15:37:39 -0400 (EDT)
Message-ID: <200710181937.l9IJbeBL009388__25518.0641696372$1416624445$gmane$org@hiauly1.hia.nrc.ca>
References: <20071018082953.GB16148@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: akpm@linux-foundation.org,
 parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071018082953.GB16148@fattire.cabal.ca> from "Kyle McMartin" at
	Oct 18, 2007 04:29:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Kyle,

> [Note, I've given up on the quilt tree for now, because it ended up
> being a bit more hassle than just keeping topic branches around.]

Have you also given up on your patch tree?  Seems to have disappeared.

Yesterday, I applied your latest patch set to 2.6.23.1 and built
an SMP kernel.  I didn't test it much but there were weird errors
(e.g., postfix failed to start because it thought user postfix
and user nobody, and apt-get reported missing groups such as
Debian-exim).  This is all bogus and the errors don't occur with
2.6.22.9 + your getdents compat patch.  I still have this kernel
around.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
