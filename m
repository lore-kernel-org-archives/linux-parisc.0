Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (mail.ireste.fr [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C10D482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 08:08:23 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id QAA07281
          for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 16:10:28 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti console problem
Date: Tue, 10 Jul 2001 16:14:32 +0200
MIME-Version: 1.0
Message-Id: <01071016143209.03565@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>


----------  Message transmis  ----------
Subject: Re: [parisc-linux] sti console problem
Date: Tue, 10 Jul 2001 16:09:28 +0200
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: awyatt@intergate.cx


the Fast Wide controller on the 735 is noy suppoerted yet .... :(
i install .9 in a external narrow drive ...

Le Mardi 10 Juillet 2001 15:55, vous avez écrit :
> Is the Fast Wide controller on the 735 supported yet? I attempted to
> install .9 and it seemed to find a controller, and error out then it
> did not find any of my drives .. (I did have a CDROM and a 1GB drive
> on the narrow controller, but I have 10GB that I'd like to use also
> heh)
>
> Andrew
>
> > Original Message from Tue, 10 Jul 2001 14:37:49  0100:>
> >
> > On Mon, Jul 09, 2001 at 04:09:02PM  0200, Matthieu Le Corre wrote:
> > > i got a 735 appollo series ,with 0.9 iso installed
> > > i've installed sti kernel all work execpt that i get an 'unable
>
> to open
>
> > > initial console " all right seems to be good
> > > don't undestand why it failed ,
> > > need help !!!
> >
> > From  it appears that STI console
> > has not been tested on 735.  Can you try a serial console install?
> >
> > When you say "all work" do you mean the installer ran and let you
> > install the system?  At which point did you get "unable to open
> > initial console"?  During the initial boot from CD, during the
> > reboot in to the second stage install, or after that, when booting
> > in to the installed system?
> >
> >
> > Richard
> >
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
> ___________________________________________________________________________
>____ This E-Mail was sent with MailMax/WEB.
> http://www.smartmax.com
>
>
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

-------------------------------------------------------

-- 
_______________________________________

                      Matthieu Le Corre 
                    Service informatique
 Ecole Polytechnique de l'Université de Nantes
     Matthieu.Lecorre@polytech.univ-nantes.fr
                        02.40.68.32.23
_______________________________________
