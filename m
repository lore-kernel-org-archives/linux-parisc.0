Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (unknown [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BC42482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 03:40:27 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id LAA03950
          for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 11:42:24 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Date: Mon, 16 Jul 2001 11:46:53 +0200
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca> <0107131413361U.03565@flambe.ireste.fr> <20010716085318.A30207@linuxcare.com>
In-Reply-To: <20010716085318.A30207@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01071611465307.01046@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>

Le Lundi 16 Juillet 2001 09:53, vous avez écrit :
> On Fri, Jul 13, 2001 at 02:13:36PM +0200, Matthieu Le Corre wrote:
> > Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> > > So I have now succesfully installed the base system on a external
> > > narrow SCSI. I can boot off of it. Now the next question is how do I
> > > set it up to go to the STI console instead of the serial?
> > >
> > > Ray
> >
> > try console=tty on palo commande line
> >
> > i try it, messages go on console but i get a "unable to open initial
> > console" and back to serial to login !
>
> I don't know whether linux supports graphical console on 735 yet.
> You could try enabling a line in /etc/inittab to spawn a getty on
> tty0, and see if you then get a login prompt.

i get it !
but i get a "unable to open initial console"
console seem to work because i get the whole message to the console ....
it's a shame that i get this "unable to open initial console"

>
> Richard

-- 
_________________________________________________
  
                    Matthieu Le Corre
                  Service informatique
   Ecole Polytechnique de l'Université de Nantes
      Matthieu.Lecorre@polytech.univ-nantes.fr
                     02.40.68.32.23
__________________________________________________
