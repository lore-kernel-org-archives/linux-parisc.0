Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ireste.fr (mail.ireste.fr [193.52.81.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14503482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 06:08:08 -0600 (MDT)
Received: from flambe.ireste.fr (flambe [193.52.81.109])
          by mail.ireste.fr (8.9.1a/jtpda-5.3.1) with SMTP id OAA04296
          for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 14:09:14 +0200 (MET DST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Date: Fri, 13 Jul 2001 14:13:36 +0200
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca>
In-Reply-To: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca>
MIME-Version: 1.0
Message-Id: <0107131413361U.03565@flambe.ireste.fr>
List-ID: <linux-parisc.vger.kernel.org>

Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> So I have now succesfully installed the base system on a external narrow
> SCSI. I can boot off of it. Now the next question is how do I set it up to
> go to the STI console instead of the serial?
>
> Ray

try console=tty on palo commande line 

i try it, messages go on console but i get a "unable to open initial console"
and back to serial to login !

----------------------------------------
Content-Type: text/html; charset="iso-8859-1"; name="Pièces jointes : 1"
Content-Transfer-Encoding: quoted-printable
Content-Description: 
----------------------------------------

-- 
_________________________________________________
  
                    Matthieu Le Corre
                  Service informatique
   Ecole Polytechnique de l'Université de Nantes
      Matthieu.Lecorre@polytech.univ-nantes.fr
                     02.40.68.32.23
__________________________________________________
