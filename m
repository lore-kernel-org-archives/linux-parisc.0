Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (mail.ireste.fr [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C03D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 04:04:52 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id MAA12276
          for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 12:07:02 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Date: Tue, 17 Jul 2001 12:11:37 +0200
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca> <01071611465307.01046@flambe.ireste.fr> <20010717103025.O30356@linuxcare.com>
In-Reply-To: <20010717103025.O30356@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01071712113702.03530@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>

Le Mardi 17 Juillet 2001 11:30, vous avez écrit :
> On Mon, Jul 16, 2001 at 11:46:53AM +0200, Matthieu Le Corre wrote:
> > Le Lundi 16 Juillet 2001 09:53, vous avez écrit :
> > > On Fri, Jul 13, 2001 at 02:13:36PM +0200, Matthieu Le Corre wrote:
> > > > Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> > > > > So I have now succesfully installed the base system on a external
> > > > > narrow SCSI. I can boot off of it. Now the next question is how do
> > > > > I set it up to go to the STI console instead of the serial?
> > > > >
> > > > > Ray
> > > >
> > > > try console=tty on palo commande line
>
> Shouldn't that be console=tty0 and not console=tty ?

not better ...


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
_________________________________________________
  
                    Matthieu Le Corre
                  Service informatique
   Ecole Polytechnique de l'Université de Nantes
      Matthieu.Lecorre@polytech.univ-nantes.fr
                     02.40.68.32.23
__________________________________________________
