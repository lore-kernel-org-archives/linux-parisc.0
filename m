Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFFF84837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 23:28:01 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Glibc cvs: ld segmentation fault
Message-ID: <1024032442.3d097eba5ead0@webmail.tiscalinet.be>
Date: Fri, 14 Jun 2002 07:27:22 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200206131704.g5DH49TT002072@hiauly1.hia.nrc.ca>
In-Reply-To: <200206131704.g5DH49TT002072@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > Don't you have additional advice?
> 
> Did you start with the debian version of glibc?  I have built 2.2.5-6
> with 3.2 and am using it.  It's possible you need to update binutils.
> Some linux versions also seem to have a tendency to cause random
> segfaults.
> 
> Since I don't think I can duplicate your environment, you will have
> to run ld under gdb to find out where it's segfaulting and get some
> sense as to what's causing the problem.

Dave,

Thanks a lot.
As my first object (right now) is to help to understand why linux crash with
network connection  when compile with gcc-3.[12], I will also work with glibc-2.2.5.

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
