Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem and power button 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Mon, 15 Apr 2002 21:23:19 +0200." <200204152123.19619.deller@gmx.de>
References: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com> <200204151232.46311.helge.deller@sap.com> <20020415173544.GO4971@sleepie.demon.co.uk>  <200204152123.19619.deller@gmx.de> 
Date: Fri, 19 Apr 2002 23:47:41 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020420054741.C4F4D482B@dsl2.external.hp.com>
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

Helge Deller wrote:
> Richard Hirst wrote:
> > Do you recall what config failed when we did try to free the memory?  I
> > tested recently with B180 and A500, both worked fine with freeing of
> > memory enabled.  IIRC the origianl problem was that init crashed on
> > boot...
...
> unfortunately I don't know which config it was. AFAIR it also never 
> happened to me, but it did for grant or bame. Maybe they know more ?

I don't recall offhand. If it's not in the mail archives, my configs
are stored in the tarballs I upload whenever I build kernels specifically
for C3000 (32-bit) or A500 (64-bit). Those tarballs are on
	ftp://ftp.parisc-linux.org/kernels/c3000 or a500

grant
