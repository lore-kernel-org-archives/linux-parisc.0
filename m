Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 968B3483D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 11:00:06 -0600 (MDT)
To: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] New testing ISO available with recent boot-floppies
Message-ID: <1022518789.3cf2660508e1c@webmail.tiscalinet.be>
Date: Mon, 27 May 2002 18:59:49 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org, duraid@fl.net.au,
	grundler@dsl2.external.hp.com, t.simonnet@esiee.fr
References: <001b01c20382$918a0a90$022a17ac@simplex> <02993B31-6F77-11D6-9D55-0030656F07A2@esiee.fr> <20020526125915.3f7af47e.varenet@esiee.fr>
In-Reply-To: <20020526125915.3f7af47e.varenet@esiee.fr>
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

Hi Thibaut,

To BAD: I made a mistake and I had to re-install my b2000.

On the other hand it is a good oportunity to test the last CD-rom.

It boot well and recognise well the ide cdrom. Nice :-)

But on the b2000 (I have no idea for b2600) the cdrom is an ide model and so
appears to be /dev/hda pseudo device.
So before install of the kernel and the base system, I had to execute a shell
and launch cd /dev; MAKEDEV hda to add require /dev/hda* then the rest works well.

Could it not be possible to add those /dev/hd[abcd]* into the initial ramdisk
(it should not take too much additional space?)?

Thanks in advance for your additionnal help and thanks again for great job,
    Joel
  
Quoting Thibaut VARENE <varenet@esiee.fr>:

> On Sat, 25 May 2002 02:33:18 +0200
> "Thibaut VARENE" <varenet@esiee.fr> wrote:
> 
> > 
> > Le samedi 25 mai 2002, à 02:24 , Duraid Madina a écrit :
> > 
> > > Does this new ISO include Grant's patch from yesterday, allowing
> booting
> > > on PA-8700 machines?
> > >
> > > If so, I will be sure to test it out!
> > >
> > > 	Duraid
> > >
> > >
> > Well, Grant told me that his patch is not comitted yet, and not ready
> to 
> > be.
> > When it will be ready, we'll consider rebuilding the ISO :o)
> > 
> 
> The new ISO is now ready, with -pa26 kernel.
> 
> Duraid reported a successful boot with his rp2430 (A400-6X), but the
> same *warnings* than for the previous ISO are still applicable :)
> Any feedback would be welcomed anyway !
> 
> You can download it from this location:
> http://pateam.esiee.fr/download.html
> And it should be made available shortly on ftp.parisc-linux.org. :)
> 
> Enjoy !
> 
> 
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://pateam.esiee.fr/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
