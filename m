Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (mail.ireste.fr [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id A29CF482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 09:22:23 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id RAA09863
          for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 17:24:30 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti console problem
Date: Tue, 10 Jul 2001 17:28:34 +0200
References: <01070916084706.01035@flambe.ireste.fr> <01071016061106.03565@flambe.ireste.fr> <20010710154549.G23509@linuxcare.com>
In-Reply-To: <20010710154549.G23509@linuxcare.com>
MIME-Version: 1.0
Message-Id: <0107101728340D.03565@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>

Le Mardi 10 Juillet 2001 16:45, vous avez écrit :
> On Tue, Jul 10, 2001 at 04:06:11PM +0200, Matthieu Le Corre wrote:
> > in fact i've installed the 0.9 iso from the serial console
> > first and second stage are correct !
> > it boot correctly , but,
> > at the end of booting process ,
> > in sti console i get an "unable to open initial" console...
> > and then a login appears in serial console !
> > in fact all boot message appears un sti console execpt the boot prompt !
> > I have check inittab and /dev/tty* files , they seems ok ! i don't
> > understand
>
> For 0.9 we had different ISOs for 32 bit STI console and 32 bit
> serial console.  It sounds as though you might have booted
> the STI ISO, but used a serial console.  You get the login prompt
> on the serial console, because that is where inittab starts a
> getty.  Sounds like kernel printk output is displayed on the STI
> console, sugests you are using the STI kernel.  Not sure about
> this though...  Check the kernel boot params; do you have
> console=tty0 or console=ttyS0?

i've install FROM serial iso BUT i've installed the sti kernel 
and i've paramater console=tty0 ;( 
i've made both serial and sti start from inittab ....
the sti console seem to work but the only think is i don't get login prompt
on sti.
but when i shutdown system message appears on sti console !

i've try 0.9.1 but it failed after "branching kernel" despite a good md5sum 
... 



> You can try the 0.9.1 CD from http://mkhppa1.esiee.fr which should
> auto-detect which console you used and route messages appropriately.
>
>
> Richard
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
_______________________________________

                      Matthieu Le Corre 
                    Service informatique
 Ecole Polytechnique de l'Université de Nantes
     Matthieu.Lecorre@polytech.univ-nantes.fr
                        02.40.68.32.23
_______________________________________
