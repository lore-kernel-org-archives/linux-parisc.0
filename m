From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: linux signal race fixes,
	patches against hppa tree, please test.
Date: Fri, 27 Aug 2004 15:50:38 -0400 (EDT)
Message-ID: <200408271950.i7RJod9D008622@hiauly1.hia.nrc.ca>
References: <20040827182626.GH25975@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040827182626.GH25975@baldric.uwo.ca> from "Carlos O'Donell" at
	Aug 27, 2004 02:26:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> jda,
> 
> This is more important for you, approximately 48 hours ago, Linus
> commited a fix for a signal handling race.
> 
> http://linux.bkbits.net:8080/linux-2.6/cset@1.1846.1.48?nav=index.html|Chang
> eSet@-2d
> 
> That is the changeset, and included is a patch against our CVS head 
> that fixes the race condition.
> 
> It could force a thread not to restart or crash, or do all sorts of
> things. It may be the bug you are seeing.

Have you tried the patch and the testcase?  The reference indicates that
it brought down a i386 SMP system in milliseconds.

> Please test it out and see if it makes the builds more stable. It could
> be the reason for random sigsegvs with expect/tcl.
> 
> The patch fixes our arch code so we *never* have a k_sigaction that
> wasn't copied without a lock held.
> 
> The new code passes around a pointer to an arch allocated k_sigaction
> and copies it with the lock held so it can't be changed between 'check'
> and 'delivery.'

Sounds good.  I think it is likely that even with this fix tcl8.4 still
needs the fix for the exit deadlock.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
