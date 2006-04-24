From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 14:55:10 -0400 (EDT)
Message-ID: <200604241855.k3OItBlv028564@hiauly1.hia.nrc.ca>
References: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Apr 24, 2006 12:50:48 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > (I'm assuming ",co" completer is PA2.0 only - please correct me if
> > that's wrong.)
> 
> It's not in the PA 1.1 arch...

Rechecked.  I should have remembered given that I updated gas to improve
the handling of cache-control completers for PA 1.1 ;(  So, we should be
using the 'co' completer except in situations (if any) where the spinlock
is shared with a non-coherent I/O processor.  However, I believe that
PA 1.1 still has the 16-byte alignment requirement.

Need to look at the uses in GCC.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
