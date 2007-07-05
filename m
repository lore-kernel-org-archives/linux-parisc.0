From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Thu, 5 Jul 2007 11:18:05 -0400 (EDT)
Message-ID: <200707051518.l65FI56n006476__16166.9711619199$1416624402$gmane$org@hiauly1.hia.nrc.ca>
References: <20070705142222.GA26105@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: seb@frankengul.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070705142222.GA26105@frankengul.org> from "seb@frankengul.org"
	at Jul 5, 2007 04:22:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Could you do glibc builds with the gcc trunk before and after the change?
> > It's best to base the PR on an unmodified version of gcc.
> 
> The test with the gcc-trunk (Main 4.3.0 head) shows the same error at the same place.

Ok, it would be useful to file a gcc PR to start.  However, it's not
clear that gcc is a fault.

It may be that glibc isn't using the visibility attribute correctly
for this symbol (i.e., hiding a symbol that is externally referenced).
You could try building glibc with the attribute removed.  This might
be somewhat hppa specific because of the nptl issue.

> > It would help to know the exact details of the linker command that
> > fails, the assembler code generated for mq_timedreceive, and the
> > __librt_multiple_threads symbols in __librt_multiple_threads librt.so.
> 
> Did you had a look at the info I sent you  (see my previous message) ?

I looked at it briefly but don't have a comment at the moment.  I was
hoping to figure out which package is responsible for this problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
