From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 15:37:33 -0400 (EDT)
Message-ID: <200405241937.i4OJbX07011585__29526.7682908618$1416623451$gmane$org@hiauly1.hia.nrc.ca>
References: <20040524183227.GW7207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524183227.GW7207@tausq.org> from "Randolph Chung" at May 24,
	2004 11:32:27 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> If you are one of those people who really care about 2.4 support, please
> speak up now! 

Here is a little background on this issue.  Randolph has done a
considerable amount of work to port libffi to the PA, and then add
unwind and other support support to libjava.  This gives us a
working Java implementation.  Thanks, Randolph!

This work is currently being integrated into GCC 3.5.  This is working
well with 2.6, but we have problems with unwinding through signal
frames on 2.4.  64-bit support is completely broken.  On at least
some 32-bit kernels, we end up with hung processes that can bring
the system to its knees.

We are having a little debate as to whether we need to support 2.4,
given that GCC 3.5 probably won't be out for a year or so.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
