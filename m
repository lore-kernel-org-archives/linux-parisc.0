Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep13-int.chello.nl (amsfep13-int.chello.nl [213.46.243.24])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0772C484A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 13:17:56 -0600 (MDT)
Received: from gatekeeper ([213.46.122.180]) by amsfep13-int.chello.nl
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20030426191754.PIPH6867.amsfep13-int.chello.nl@gatekeeper>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 26 Apr 2003 21:17:54 +0200
Received: from laptop ([10.0.3.2] ident=arjen)
	by gatekeeper with esmtp (Exim 3.35 #1 (Debian))
	id 199VHL-00047Q-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Apr 2003 21:24:07 +0200
From: Arjen Hommersom <arjenh@chello.nl>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sstfb crash
Date: Sat, 26 Apr 2003 20:14:31 +0200
References: <200304251408.39242.arjenh@chello.nl> <200304251813.33948.arjenh@chello.nl> <3EA97C37.5010403@tiscali.be>
In-Reply-To: <3EA97C37.5010403@tiscali.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200304262014.31828.arjenh@chello.nl>
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

On Friday 25 April 2003 20:19, Joel Soete wrote:

> >IAOQ = 10135394
> >Func: kfree, Off: 34, Addr: 0x10135394
>
> here is the kernel function which made panic kernel. (why? we need
> expert help)
>

It seems that the crash occurs at this code piece (line 902 of sstfb.c):

        if (old_bpp != var->bits_per_pixel) {
            if ((err = fb_alloc_cmap(&display->cmap, 0, 0)))
                return err;
            sstfb_install_cmap(con, info);
        }

old_bpp is some strange value (seems random, nothing realistic) and is not 
equal to var->bits_per_pixel (16 in my case). The fb_alloc_cmap is called to 
free the old colormap and that seems to be impossible. Commenting out that 
call and setting the monitor type to 1024x768 makes it work most of the 
times. 

Any suggestions for a correct fix are appreciated.

Arjen Hommersom
