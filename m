Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50EEC4859
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Feb 2002 15:56:55 -0700 (MST)
To: "Tilo Jandt" <tilo@jandt-online.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sound 
In-Reply-To: Message from "Tilo Jandt" <tilo@jandt-online.net>
   of "Tue, 26 Feb 2002 23:40:09 +0100." <001101c1bf16$8bc14750$0801a8c0@epsilon>
References: <Pine.NEB.4.33.0202160643280.23380-100000@www2.scram.de>  
 <001101c1bf16$8bc14750$0801a8c0@epsilon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 15:56:53 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020226225653.616C437CF5@carmen.fc.hp.com>
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

"Tilo Jandt" writes...

> Hi,
> 
> does anyone get the Sound on a 712/60 work?

Yes.

> Is it possible to play MP3's using XMMS on this system or is it to hard for
> it?

Yes, no.

> Or doesn't Debian support this soundcard at this time ?

Yes. You need the harmony driver, which was recently added to defconfig and 
should be in recent pre-build kernels ftp site and kernel-image packages in 
the Debian archive.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
