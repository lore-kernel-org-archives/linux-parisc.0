From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: linux signal race fixes,
	patches against hppa tree, please test.
Date: Tue, 31 Aug 2004 00:23:33 -0400 (EDT)
Message-ID: <200408310423.i7V4NXjb001644@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Aug 27, 2004 10:36:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > This is more important for you, approximately 48 hours ago, Linus
> > commited a fix for a signal handling race.
> > 
> > http://linux.bkbits.net:8080/linux-2.6/cset@1.1846.1.48?nav=index.html|Chang
> > eSet@-2d
> 
> I have the patch under test on hiauly6 with todays CVS.

I've been running this now for three days on hiauly6 with a 32-bit
2.6.8.1-pa7 kernel (default c3000 config) doing almost continuous gcc
builds.  Things seem pretty promising.  No random SIGSEGVs and expect
seems to be behaving itself.

> I had another SIGSEGV on gsyprf11.  It looks as if this was in /bin/sh
> although gdb doesn't say which program the fault ocurred in.

This is definitely not the case with the 64-bit SMP kernel on gsyprf11.
There I've been testing with an unpatched kernel.  Expect works better with
tcl8.3 but there are still some tests that fail when they shouldn't, and
the output with tests which produce a large amount of output gets
truncated.  With tcl8.4, expect has major problems.  The Tcl_Finalize
patch doesn't fix them.  I think we need to try Carlos's patch on a
64-bit SMP system to see if it helps the expect and SEGV problems.

I'm off to Korea early Thursday morning so I can't do much more on
this until I'm back in a couple of weeks.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
