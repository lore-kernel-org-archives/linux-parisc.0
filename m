Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88954482A
	for <parisc-linux@parisc-linux.org>; Wed,  5 Jun 2002 10:11:57 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023293516.3cfe384c3bc56@webmail.tiscalinet.be>
Date: Wed, 05 Jun 2002 18:11:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
References: <200206031738.g53HcNjL011765@hiauly1.hia.nrc.ca> <1023172365.3cfc5f0d1b7f7@webmail.tiscalinet.be>
In-Reply-To: <1023172365.3cfc5f0d1b7f7@webmail.tiscalinet.be>
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

Hi Dave,

Quoting joel.soete@freebel.net:

> Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> 
> > > I really have no chance with this b2000:
> > > I broken first my install and now it makes a HPMC in the middle of
> > binutils
> > > build and the pim info are not clear :((
> > 
> > I'd try a new kernel first.
> 
> Very strange behaviour: 
> with some difficulties I reach to restart a kernel then I launch  my
> toolchain
> script (which failled because of __therad problem), I change the faulty
> header
> and finaly relaunch script which failled in a tar xjf (some time during
> the
> first extract of binutils, some time during the second extract of gcc32)
> what
> ever the kernel I used 2.4.18-pa24 2.4.18-pa24+lvm1.0.4
> 2.4.19-pre8-pa29?.
> 
> But thanks to the console logs grab with minicom I reach to notice the
> "BUG":
> 
> Debian GNU/Linux 3.0 palx2000 ttyS0
> 
> palx2000 login:
> 
> kernel BUG at superio.c:109!
> WARNING! Stack pointer and cr30 do not correspond!
> Dumping virtual address stack instead
> 
> Dumping Stack from 0x2ee00000 to 0x2ee00bc0:
> ...
> 
> What could the reason why the tar xjf is successfull a first time and
> when it is
> relaunched, it fails? Ext3 fs (I am not sure how can I change back to
> ext2) bash
> (which other sh may I try) ?
> 

Well what ever was the fs type (ext2 or ext3) the problem was the same;
apparently until the fs was clearly corrupted and required a fsck. Everything
seems to come back Ok.

So finaly I had to replace __thread to _thr in some glibc headers (already
changed in the glibc cvs actually change __thread to __threadp) and now the
toolchaine compiles successfully for gcc-3.2.

The kernel still compiles and boot well :) 
But the inetd connection also still there :( (hope kdb will help)

Thanks again for help,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
