Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta06ps.bigpond.com (mta06ps.bigpond.com [144.135.25.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8ECDF482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 17:14:36 -0700 (MST)
Received: from bubble.local ([144.135.25.75]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GMRKZ900.40J for <parisc-linux@parisc-linux.org>; Wed, 14 Nov
          2001 10:21:09 +1000
Date: Wed, 14 Nov 2001 10:44:27 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Deb's broken ?
Message-ID: <20011114104427.A6922@bubble.sa.bigpond.net.au>
References: <20011113181352.B382@hp.is> <20011113193330.D12388@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011113193330.D12388@lug-owl.de>; from jbglaw@lug-owl.de on Tue, Nov 13, 2001 at 07:33:30PM +0100
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

On Tue, Nov 13, 2001 at 07:33:30PM +0100, Jan-Benedict Glaw wrote:
> I've tried to natively build 2.2.4-4 on a 712/60 with gcc-3.0. It
> breaks in ./glibc-2.2.4/sysdeps/hppa/dl-machine.h at line 534:
> 
>     533       /* .eh_frame can have unaligned relocs.  */
> --> 534       if (reloc_addr & 3)
>     535         {
>     536           char *rel_addr = (char *) reloc_addr;

My dl-machine.h has

      if ((unsigned long) reloc_addr & 3)

I guess you are trying to use an old buggy glibc.

Alan
