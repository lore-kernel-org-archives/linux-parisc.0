Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA09271
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 23:09:47 -0600
From: chester@linux.org.tw
Received: from tlug.sinica.edu.tw (HELO linux.org.tw) (root@140.109.13.42)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 05:10:53 -0000
Received: from localhost (chester@localhost)
	by linux.org.tw (8.9.3/8.9.3) with ESMTP id NAA21676;
	Thu, 29 Jun 2000 13:12:29 +0800
Date: Thu, 29 Jun 2000 13:12:29 +0800 (CST)
To: chester@linux.org.tw
cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userland test failure
In-Reply-To: <Pine.LNX.4.10.10006291258380.19961-100000@localhost.localdomain>
Message-ID: <Pine.LNX.4.10.10006291309001.21585-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I should describe my situation more clear!!
I have a pa-risc box that didn't have MMU in it.i need this compile option
-fPIC to test some program.
(My pa-risc box is 1.1 architecture without MMU and 902xx CPU)

Thanks,

On Thu, 29 Jun 2000 chester@linux.org.tw wrote:

> Thanks,
> Could you give me a hint to fix that(Maybe from source code),
> 
> 
> 				Chester
> 
> 
> On Thu, 29 Jun 2000, Alan Modra wrote:
> 
> > On Thu, 29 Jun 2000 chester@linux.org.tw wrote:
> > 
> > > But if i add -fPIC options,get
> > > 
> > > /tmp/cc4QxRpc.o : In function 'main'
> > > /mnt/download/PA/hello.c:3: undefined reference to `$global$`
> > 
> > -fPIC and -shared are not supported at the moment, even with the newer
> > binutils-2.10 module available from puffin CVS.  With binutils-2.10,
> > you'll get a different error if you compile with -fPIC, something like:
> > "cannot handle relocation R_PARISC_DLTIND21L for .LC0 at 0x28 in .text"
> > 
> > Alan Modra
> > -- 
> > Linuxcare.  Support for the Revolution.
> > 
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> > 
> 
