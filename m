From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Sun, 6 May 2007 16:14:57 -0400 (EDT)
Message-ID: <200705062014.l46KEwGC028974__42059.9829093137$1416624355$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705061209k26717859y19b7f4aa0272d386@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705061209k26717859y19b7f4aa0272d386@mail.gmail.com>
	from "Carlos O'Donell" at May 6, 2007 03:09:56 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yes, I fixed this in my local tree already. For some reason we aren't
> liking in libgcc_s.so.
> 
> http://www.parisc-linux.org/~carlos/2007-05-06-nptl.diff
> 
> Dave, are our specs broken in gcc?

Don't think so.

The link command specifies -nostdlib and -lgcc.  The former means
that gcc shouldn't provide any standard libraries.  The latter links
against libgcc.a.  It doesn't have the unwind stuff.  You need to
either add -lgcc_eh or use -lgcc_s in the link command.

The default for the gcc driver is to link using the archive version
of libgcc.  You can add --shared-libgcc to cause it to use the shared
version.  The g++ driver uses the shared version by default.  Of
course, this doesn't happen when -nostdlib is specified.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
