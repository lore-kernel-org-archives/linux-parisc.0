Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09E6C482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 May 2001 05:50:21 -0600 (MDT)
Sender: delahaym@esiee.fr
Message-ID: <3AFBD3C5.3FE0E2CD@esiee.fr>
Date: Fri, 11 May 2001 13:57:57 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
	puufin@esiee.net
Subject: Re: [parisc-linux] Serial PDC console on 712/601
References: <3AF5AF65.C685635C@gmx.at> <3AF68199.8CCD7FD2@esiee.fr> <3AF69393.F9C5C6E1@alcatel.at>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I have to recognize I have absolutely no idea. 

Regards,
Matthieu



Christoph Plattner wrote:
> 
> Very intersting the method of using the ISL commands to switch
> over. And I think I also can switch back using this method.
> Is this correct ?
> 
> But what is this "dagger" card.
> Where does the machine store the information ?
> Flash/EEPROM/battery backuped SRAM ?
> Can I do a "backup" copy (I have an universial chip programmer
> at home, and other tools !) ?
> Can I make such a "dagger" card (whatever it is ?
> 
> Please give me some hints, before I "risk" the change !
> 
> With friendly regards
>         Christoph Plattner
> 
> ------------------------------------------------------------------
> private:  christoph.plattner@gmx.at
> company:  christoph.plattner@alcatel.at
> 
> Matthieu Delahaye wrote:
> >
> > Christoph Plattner wrote:
> > >
> > > Hello HP hackers !
> > >
> > > I have a problem setting the PDC console path to serial.
> > > How can be done this on the HP 712/60.
> > > On my 9000/720 I can use the `path' command on the PDC
> > > console (admin mode). But on the 712/60, the `path' command
> > > only sets the boot paths (primary, secondary), but not the
> > > console.
> > >
> > > Is it possible to use the 712/60 with serial console only
> > > (no display and keyboard) ?
> > > How can I set serial console ?
> > >
> > > With friendly regards
> > >         Christoph Plattner
> > >
> > > --
> > > -------------------------------------------------------------------------
> > > private:        christoph.plattner@gmx.at
> > > company:        christoph.plattner@alcatel.at
> > >
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> >
> > >From Pa-RISC/Linux Boot Howto:
> >
> > 3.1.2.3.3. How can I change the boot console to serial on a 712?
> >
> >    Unfortunately, you can't. Although 712s are configured for in-house
> > HP development to use serial console, this configuration
> >    isn't supported in the field. You have to use a graphics console for
> > 712s.
> >
> > http://www.oswg.org/oswg-nightly/oswg/en_US.ISO_8859-1/articles/
> > parisc-linux/parisc-linux-boot/
> >
> > But it seems you can, after dangerous manipulations:
> >
> > http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008117.html
> >
> > regards,
> > Matthieu
> >
> > --
> > Matthieu Delahaye
> > ESIEE Team
> > http://mkhppa1.esiee.fr/
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
> ------------------------------------------------------------------
> private:  christoph.plattner@gmx.at
> company:  christoph.plattner@alcatel.at
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/
