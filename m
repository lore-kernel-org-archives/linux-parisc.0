Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5A7B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 10:10:34 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Linux palinux 2.4.19-pre5-pa0 #2 Mon Apr 8 15:16:06 CEST 2002 parisc unknown
Message-ID: <1018282170.3cb1c0ba7f792@webmail.tiscali.be>
Date: Mon, 08 Apr 2002 18:09:30 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1018277506.3cb1ae82d2cca@webmail.tiscali.be> <20020408160310.G27547@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020408160310.G27547@parcelfarce.linux.theplanet.co.uk>
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

Thanks.

Having a look in more details, I just see that there is only one place where
vmalloc is used in place of kmalloc and it is deliberately used. On the contrary
IIRC this was a cause of problems in early evms. Also as I do not actually need
this module (right now), I prefered to remove this from my config for the moment.

Joel

Quoting Matthew Wilcox <willy@debian.org>:

> On Mon, Apr 08, 2002 at 04:51:46PM +0200, joel.soete@freebel.net wrote:
> > Hi all,
> > 
> > It seems to works just still have a problem with modules:
> > 
> > mkdir -p pcmcia; \
> > find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{}
> pcmcia
> > if [ -r System.map ]; then /sbin/depmod -ae -F System.map 
> 2.4.19-pre5-pa0; fi
> > depmod: *** Unresolved symbols in
> > /lib/modules/2.4.19-pre5-pa0/kernel/drivers/scsi/scsi_debug.o
> > depmod: 	vmalloc
> > make: *** [_modinst_post] Error 1
> > Mon Apr  8 16:04:06 CEST 2002
> 
> You got a warning before this, something like `implicit declaration of
> function vmalloc'.  ie you forgot to #include <linux/vmalloc.h>
> 
> -- 
> Revolutions do not require corporate support.
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
