Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CDED482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 03:32:21 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A4A30B00D; Tue, 17 Jul 2001 10:30:25 +0100 (BST)
Date: Tue, 17 Jul 2001 10:30:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Message-ID: <20010717103025.O30356@linuxcare.com>
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca> <0107131413361U.03565@flambe.ireste.fr> <20010716085318.A30207@linuxcare.com> <01071611465307.01046@flambe.ireste.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <01071611465307.01046@flambe.ireste.fr>; from matthieu.lecorre@polytech.univ-nantes.fr on Mon, Jul 16, 2001 at 11:46:53AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 16, 2001 at 11:46:53AM +0200, Matthieu Le Corre wrote:
> Le Lundi 16 Juillet 2001 09:53, vous avez écrit :
> > On Fri, Jul 13, 2001 at 02:13:36PM +0200, Matthieu Le Corre wrote:
> > > Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> > > > So I have now succesfully installed the base system on a external
> > > > narrow SCSI. I can boot off of it. Now the next question is how do I
> > > > set it up to go to the STI console instead of the serial?
> > > >
> > > > Ray
> > >
> > > try console=tty on palo commande line

Shouldn't that be console=tty0 and not console=tty ?

Richard
