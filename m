Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 819E9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 01:55:07 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7C9F4B00C; Mon, 16 Jul 2001 08:53:18 +0100 (BST)
Date: Mon, 16 Jul 2001 08:53:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthieu Le Corre <matthieu.lecorre@polytech.univ-nantes.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] setting up the STI console on a 735/99
Message-ID: <20010716085318.A30207@linuxcare.com>
References: <001401c10b94$29aa0c40$0f809b8e@ati.stlawrencec.on.ca> <0107131413361U.03565@flambe.ireste.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <0107131413361U.03565@flambe.ireste.fr>; from matthieu.lecorre@polytech.univ-nantes.fr on Fri, Jul 13, 2001 at 02:13:36PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 13, 2001 at 02:13:36PM +0200, Matthieu Le Corre wrote:
> Le Jeudi 12 Juillet 2001 20:52, vous avez écrit :
> > So I have now succesfully installed the base system on a external narrow
> > SCSI. I can boot off of it. Now the next question is how do I set it up to
> > go to the STI console instead of the serial?
> >
> > Ray
> 
> try console=tty on palo commande line 
> 
> i try it, messages go on console but i get a "unable to open initial console"
> and back to serial to login !

I don't know whether linux supports graphical console on 735 yet.
You could try enabling a line in /etc/inittab to spawn a getty on
tty0, and see if you then get a login prompt.

Richard
