Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ati6.ati.stlawrencec.on.ca (unknown [142.155.128.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE29C482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 06:45:31 -0600 (MDT)
Message-ID: <000901c10b9a$069f8030$0f809b8e@ati.stlawrencec.on.ca>
From: "rpengelly" <rpengelly@ati.stlawrencec.on.ca>
To: "Matthieu Le Corre" <matthieu.lecorre@polytech.univ-nantes.fr>,
	<parisc-linux@lists.parisc-linux.org>
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca> <0107131413361U.03565@flambe.ireste.fr>
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Date: Fri, 13 Jul 2001 08:47:50 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I tried that but with the same result. Is there any way to get away from the
serial console and use the monitor for the 735? We're trying to set up a lab
of 700 and 735 for students so we need to get them running without the
serial console.


----- Original Message -----
From: "Matthieu Le Corre" <matthieu.lecorre@polytech.univ-nantes.fr>
To: <parisc-linux@lists.parisc-linux.org>
Sent: Friday, July 13, 2001 8:13 AM
Subject: Re: [parisc-linux] setting up the STI console on a 735/99


> Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> > So I have now succesfully installed the base system on a external narrow
> > SCSI. I can boot off of it. Now the next question is how do I set it up
to
> > go to the STI console instead of the serial?
> >
> > Ray
>
> try console=tty on palo commande line
>
> i try it, messages go on console but i get a "unable to open initial
console"
> and back to serial to login !
>
> ----------------------------------------
> Content-Type: text/html; charset="iso-8859-1"; name="Pièces jointes : 1"
> Content-Transfer-Encoding: quoted-printable
> Content-Description:
> ----------------------------------------
>
> --
> _________________________________________________
>
>                     Matthieu Le Corre
>                   Service informatique
>    Ecole Polytechnique de l'Université de Nantes
>       Matthieu.Lecorre@polytech.univ-nantes.fr
>                      02.40.68.32.23
> __________________________________________________
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
