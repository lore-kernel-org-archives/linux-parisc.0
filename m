From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] Optimi[zs]e copy_*_user routines
Date: Fri, 10 Sep 2004 04:46:08 -0400 (EDT)
Message-ID: <200409100846.i8A8k8ED027093@hiauly1.hia.nrc.ca>
References: <20040910081429.GL28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040910081429.GL28659@tausq.org> from "Randolph Chung" at Sep
	10, 2004 04:14:29 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> In reference to a message from John David Anglin, dated Sep 10:
> > Have you looked at using stby or stdby for unaligned copies?
> 
> do you mean for the entire copy, or just to copy enough bytes to get it
> aligned?

I believe that the "b" completer can be used to write the first set
of bytes needed to get you to an alignment boundary.  The "e" completer
can be used to store the final residual.  The PA block move in GCC
uses the latter.  Basically, you use aligned loads and stby/stdby
to store the right set of bytes at the beginning and end.  It's much
more efficient than doing the beginning and end byte by byte.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
