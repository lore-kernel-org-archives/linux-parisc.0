Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50E38485E
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 17:18:57 -0700 (MST)
To: "Tilo Jandt" <tilo@jandt-online.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Sound 
In-Reply-To: Your message of "Wed, 27 Feb 2002 00:14:46 +0100."
             <001101c1bf1b$6205bd10$0801a8c0@epsilon>
References: <Pine.NEB.4.33.0202160643280.23380-100000@www2.scram.de>
 <001101c1bf16$8bc14750$0801a8c0@epsilon> <20020226225653.616C437CF5@carmen.fc.hp.com>  <001101c1bf1b$6205bd10$0801a8c0@epsilon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 17:18:50 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020227001850.7F31A37CF5@carmen.fc.hp.com>
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

cc'd to the list...

"Tilo Jandt" writes...

> I've got Kernel 2.4.17-pa27.
> How do I install the harmony driver? I'm not so skilled with Debian HPPA and
> don't know what to do.

You need to enable CONFIG_SOUND_HARMONY in the kernel config when you build a 
kernel. If you're using a prebuilt kernel from the ftp site the tarball 
contains the config file it was built with. If you are using

ftp://ftp.parisc-linux.org/kernels/32/32-2.4.17-pa27.tar.gz

that kernel contains the harmony driver and it should just work. I've used 
xmms and mpg321 and they work great.

Good luck,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
