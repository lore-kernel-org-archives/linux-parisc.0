Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hsbcsv17.hsbc.com.br (hsbcsv17.hsbc.com.br [200.208.29.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id C12294829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 08:56:59 -0600 (MDT)
Received: from pop.hsbc.com.br (unverified) by hsbcsv17.hsbc.com.br
 (Content Technologies SMTPRS 4.2.10) with ESMTP id <T5ddfb910cbac1c505343c@hsbcsv17.hsbc.com.br> for <parisc-linux@parisc-linux.org>;
 Fri, 11 Oct 2002 11:56:46 -0300
Received: from pcaktel083 ([167.10.11.219])
	by pop.hsbc.com.br (8.11.6/8.11.6) with SMTP id g9BEuh214144
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 11:56:43 -0300
Message-ID: <004301c27136$59b063e0$db0b0aa7@pcaktel083>
From: "Jeffo" <jeffo@pop.hsbc.com.br>
To: <parisc-linux@parisc-linux.org>
Date: Fri, 11 Oct 2002 11:56:16 -0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] HP Boot
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

 Another information:

 When trying to making system bootable (I installed the whole thing over
 again)
 it displays a message: "Problem: PALO wasn´t able to install. You can
stuill
 remote boot and
 point the root device to the installed system".

 How the heck I do that??? =)

 If I try to "make the system bootable" again then the screen goes clear and
 it returns to the beggining
 of the process like I said below.

 Sorry to bother you with those questions, but I really would like to run
 this dist on my machine..

 Thanks!
 Jeffo.

 ----- Original Message -----
 From: Jeffo <jeffo@pop.hsbc.com.br>
 To: Thibaut VARENE <varenet@esiee.fr>
> Sent: Friday, October 11, 2002 11:18 AM
> Subject: Re: [parisc-linux] HP Boot
>
>
> > Hello.
> >
> > I read many docs and none of them explain it in detail how to exactly to
> > change my boot rom settings.
> > All mentions to ISL are to use serial connections only.....which is not
my
> > case... =(
> >
> > I just wanna change the boot path, that is, point to the Vmlinux guy.
> >
> > Another thing: after concluding installation, when I go to the step
"Make
> > system bootable", the screen (installer) goes blue and returns to the
very
> > beggining of the process "Welcome to....blablabla..."
> >
> > Any hints?
> > Thanks.
> > Jeffo.
> >
> > ----- Original Message -----
> > From: Thibaut VARENE <varenet@esiee.fr>
> > To: <parisc-linux@lists.parisc-linux.org>
> > Cc: <jeffo@pop.hsbc.com.br>
> > Sent: Friday, October 11, 2002 10:30 AM
> > Subject: Re: [parisc-linux] HP Boot
> >
> >
> > > On Fri, 11 Oct 2002 10:03:11 -0300
> > > "Jeffo" <jeffo@pop.hsbc.com.br> wrote:
> > >
> > > >  Hi all.
> > > >
> > > >  How to properly configure my HP 712/60 for loading the right boot
> > files?
> > > >  (/target/boot/vmlinux)?
> > > >  (Oh, by the way, the boot installer tried to look for the files in
> > > >  /target/vmlinux, and on the CD we can see /target/boot/vmlinux)
> > > >
> > > >  I guess I have to play with the ISL...but I couldn´t find the right
> > > > commands
> > > >  for changing the default (/stand/hpux which don´t even exists
> anymore)
> > to
> > > > my
> > > >  boot thing.
> > > >
> > >
> > > Everything is explained on the PA-RISC/Linux Boot HOWTO, released as
of
> > > 2002-10-04 (sorry the release date hasn't been correctly set in the
> > changelog) in its 1.0 version.
> > > Please check:
> > > http://pateam.esiee.fr/doc.html
> > >
> > > HTH,
> > >
> > >
> > > Thibaut VARENE
> > > The PA/Linux ESIEE Team
> > > http://pateam.esiee.fr/
> > >
> >
>
