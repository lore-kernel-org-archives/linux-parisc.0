From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Fri, 1 Jun 2007 22:03:05 -0400 (EDT)
Message-ID: <200706020203.l52235DP011866__46261.6207464181$1416624382$gmane$org@hiauly1.hia.nrc.ca>
References: <20070602015507.GU23968@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070602015507.GU23968@parisc-linux.org> from "Matthew Wilcox"
	at Jun 1, 2007 07:55:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I advise not updating to libc6 2.5-9.  More than pie apps seem
> > affected.  For example, svn is broken on my system.  _start in
> > *crt1.o needs fixing.
> 
> This is a matter of some urgency -- I heard glibc 2.5 moved into Debian
> Testing today.

Yes.  I just did an apt-get update about 30 minutes ago.

This is what I see when I do a gcc_update:
dave@mx3210:~/gnu/gcc-4.3/gcc$ contrib/gcc_update
Updating SVN tree
At revision 125275.
svn: Can't read directory '.': Partial results are valid but processing is incomplete
Adjusting file timestamps

Lock files are getting messed up and svn cleanup fails.  A full checkout
does work but that's several hundred megabytes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
