Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3545781E7
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 11:47:49 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C92A3B007; Fri, 16 Mar 2001 18:46:59 +0000 (GMT)
Date: Fri, 16 Mar 2001 18:46:59 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: New glibc on 715/75
Message-ID: <20010316184659.A31505@linuxcare.com>
References: <20010316115535.X31505@linuxcare.com> <20010316162517.Z31505@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010316162517.Z31505@linuxcare.com>; from rhirst@linuxcare.com on Fri, Mar 16, 2001 at 04:25:17PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 16, 2001 at 04:25:17PM +0000, Richard Hirst wrote:
> On Fri, Mar 16, 2001 at 11:55:35AM +0000, Richard Hirst wrote:
> > I am trying the glibc etc from newcompilers-20010314 on my 715/75.
> > It seems anything that is dynamically linked hangs on exit.
> 
> Hangs in this loop:
> 
> 0x40014150 <__hppa_make_fptr+56>:       ldw 5f0(sr0,r1),r1
> 0x40014154 <__hppa_make_fptr+60>:       ldcw  0(sr0,r1),r1
> 0x40014158 <__hppa_make_fptr+64>:       cmpib,= 0,r1,0x40014150 <__hppa_make_fptr+56>
> 0x4001415c <__hppa_make_fptr+68>:       addil 0,r19,%r1
> 
> r19 = 4001a930.
> 
> For a good run on the B180, I get in to this code with the
> same r19.  r1=r19, r1+0x5f0=0x4001af20
> 
> 0x4001af20 <errno+1848>:        0x4001a7c8
> 
> 0x4001a7c8 <__hppa_fptr_lock>:  0x00000001

Arggh!  That's not 16 byte aligned.
