Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Peter Lavender" <plaven@bigpond.net.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] mpg321 on 715/64? 
In-Reply-To: Message from "Peter Lavender" <plaven@bigpond.net.au>
   of "Tue, 08 Jan 2002 06:47:19 +1100." <014501c197b4$1e1f4dc0$090ba8c0@winnie>
References: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de> <20020107124029.GF25927@sleepie.demon.co.uk>  <014501c197b4$1e1f4dc0$090ba8c0@winnie> 
Date: Mon, 07 Jan 2002 18:56:38 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020108015638.8D4E0482A@dsl2.external.hp.com>
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

"Peter Lavender" wrote:
> > Or look in <ftp://ftp.parisc-linux.org/kernels/32/> in a day or two.
> > Should find fresh kernel builds there on a daily basis, I think.
> 
> There's a kernel there.  Is this just a drop in  replacement?

Yes. Mostly. Just make sure the new kernel has the same name
as the existing kernel. Rename the existing kernel first.
You do not have to run palo unles you want to change kernel
parameters or update the "emergency" kernel on the 0xF0 partition.
(The FAQ has more on kernel boot parameters)

> While I'm at asking stupid questions, what packages so I need install to
> build kernels?   I installed the 0.9.3 release, but make and it's pals are
> missing.

See the "Build" links on www.parisc-linux.org in the navigation bar.

grant
