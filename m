Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (mail.ireste.fr [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 359DA482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 08:00:00 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id QAA07051
          for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 16:02:07 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti console problem
Date: Tue, 10 Jul 2001 16:06:11 +0200
References: <01070916084706.01035@flambe.ireste.fr> <20010710143749.E23509@linuxcare.com>
In-Reply-To: <20010710143749.E23509@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01071016061106.03565@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>

in fact i've installed the 0.9 iso from the serial console
first and second stage are correct !
it boot correctly , but,
at the end of booting process ,
in sti console i get an "unable to open initial" console...
and then a login appears in serial console !
in fact all boot message appears un sti console execpt the boot prompt !
I have check inittab and /dev/tty* files , they seems ok ! i don't understand 



Le Mardi 10 Juillet 2001 15:37, vous avez écrit :
> On Mon, Jul 09, 2001 at 04:09:02PM +0200, Matthieu Le Corre wrote:
> > i got a 735 appollo series ,with 0.9 iso installed
> > i've installed sti kernel all work execpt that i get an 'unable to open
> > initial console " all right seems to be good
> > don't undestand why it failed ,
> > need help !!!
>
> From <http://mkhppa1.esiee.fr/list.html> it appears that STI console
> has not been tested on 735.  Can you try a serial console install?
>
> When you say "all work" do you mean the installer ran and let you
> install the system?  At which point did you get "unable to open
> initial console"?  During the initial boot from CD, during the
> reboot in to the second stage install, or after that, when booting
> in to the installed system?
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
