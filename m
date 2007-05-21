From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
Date: Mon, 21 May 2007 15:04:38 -0400 (EDT)
Message-ID: <200705211904.l4LJ4dh5027982__44099.9417951845$1416624359$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705211130w461d0f4fn3bf2833f40f58e60@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: libc-ports@sourceware.org,
 aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705211130w461d0f4fn3bf2833f40f58e60@mail.gmail.com>
	from "Carlos O'Donell" at May 21, 2007 02:30:34 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Yah, this just occurred to me.  It would be nice if the code could
> > use EAGAIN from errno.h but I can see that that's a bit tricky.
> > Possibly, a macro argument would work.
> 
> I don't want to be at the *whim* of users who might redefine EAGAIN. I
> think the value should be fixed and immutable.

Users who redefine names reserved by POSIX should be lined up and ...

You are quite safe in fixing the value as any change in the error
number for EAGAIN would break binaries that check for this code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
