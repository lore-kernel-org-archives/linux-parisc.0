Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84E6A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:18:34 -0600 (MDT)
Date: Wed, 16 Apr 2003 15:18:23 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
Cc: Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: Presicionbook success
In-Reply-To: <03Apr16.163312cest.119050@ns.hiscom.nl>
Message-ID: <Pine.LNX.4.44.0304161516240.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-15
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

On Wed, 16 Apr 2003, [iso-8859-1] "Beerse, Corn=E9" wrote:

> This gives me more and more the impression it is definitly some predecess=
or
> of http://www6.tomshardware.com/storage/20030130/index.html
>
> I think the ide interface is not perfectly hidden behind the scsi interfa=
ce,
> the cpu can still somehow recognize the ide interface. The ide interface
> cannot do dma and irq since that is hooked to the scsi interface, not to =
the
> cpu/memory. Hence, I think the best the ide driver can do is not to try
> later but to be disabled at all. Btw, what happens if the ide says to try
> later, is there a total system pause (resulting in a halt)? or does the
> remainder of the system continue (and is it save to ignore)?

As stated in my earlier mails, it

- hangs (I waited for quite a while!)
- or continues (if ide=3Dnodma is used)

Slan, Max
