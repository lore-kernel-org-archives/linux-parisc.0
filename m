Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 209DE482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 10:52:13 -0700 (MST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: xam@cs.ucc.ie (M. Grabert), willy@debian.org,
	climent@stybba.ntc.nokia.com, parisc-linux@lists.parisc-linux.org,
	taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] 64bit newbie question 
In-Reply-To: Your message of "Fri, 05 Apr 2002 12:31:57 EST."
             <200204051731.g35HVwSq014375@hiauly1.hia.nrc.ca>
References: <200204051731.g35HVwSq014375@hiauly1.hia.nrc.ca> 
Date: Fri, 05 Apr 2002 10:52:12 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020405175212.22A89381FC@carmen.fc.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"John David Anglin" writes...

> > What are the issues why no 64bit userland is supported yet ?
> > (Besides too many bugs in the compiler ?) Is this difficult to archive?
> 
> Too many bugs in the compiler?  The 64-bit testsuite results under
> hpux aren't that bad:-)  I posted new results yesterday:
> <http://gcc.gnu.org/ml/gcc-testresults/2002-04/msg00160.html>.  Still
> lots of work to do but I don't think there are any show stoppers.

It's worth pointing out that the majority of the work probably lies in the
porting of glibc and not the compiler. Although I'm sure there a still some
fun bugs left in the compiler too :)

Anybody considering the port should probably express their intent to do so
on this mailing list so they can get as much help/documentation/support as
possible.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
