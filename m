Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from aistrend.allinterior.com (aistrend.allinterior.com [209.194.65.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id E44FA482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 09:27:08 -0700 (MST)
Received: from ealfert (ais1.allinterior.com [209.194.65.122] (may be forged))
	by aistrend.allinterior.com (8.11.1/8.11.1) with SMTP id fBDGOev04729
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 11:24:40 -0500 (EST)
Message-ID: <001e01c183f3$de0537a0$830000c0@ealfert>
From: "Edward Alfert" <edward@alfert.com>
To: <parisc-linux@lists.parisc-linux.org>
References: <001101c183db$4be88290$0201a8c0@w2kpro> <E16EWsG-0000Ah-00@linuxlab.wdf.sap-ag.de>
Subject: Re: [parisc-linux] What keywords should I use to find the answer?
Date: Thu, 13 Dec 2001 11:33:15 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

i consider myself a newbie (but i'm willing to learn), so please cut me some
slack, but building the kernel didn't work for me.

this is what i did:
su
cd
mkdir source
ftp ftp.parisc-linux.org
user: anonymous
password: edward@alfert.com
cd cvs
get linux-latest.tar.gz     (also tried linux-2.4.16-pa19.tar.gz)
get palo-latest.tar.gz
quit

cd source

zcat linux-latest.tar.gz | tar -xf -    (nothing gets extracted)
zcat linux-2.4.16-pa19.tar.gz | tar -xv -    (nothing gets extracted)
zcat palo-latest.tar.gz | tar -xf -  (tons of files are extracted into palo
folder)

gunzip *
tar -tvf linux-latest.tar   (no files are listed)
tar -tvf linux-2.4.16-pa19.tar.gz   (no files are listed)
tar -tvf palo-latest.tar.gz   (tons of files are listed)

Why is the linux* files empty?  did i do something wrong?

----- Original Message -----
From: "Helge Deller" <helge.deller@sap.com>
To: "Edward Alfert" <edward@alfert.com>;
<parisc-linux@lists.parisc-linux.org>
Sent: Thursday, December 13, 2001 9:30 AM
Subject: Re: [parisc-linux] What keywords should I use to find the answer?


> Hi Edward,
>
> Hmm, I think we forgot to backport the stifb-PCI hack :-(
>
> The reson behind this "I'm not trying to set up the PCI graphic
> card now... It would freeze your machine" message is, that
> during the initialisation of the A4977A Visualize EG PCI card
> (which is often found in c3000 workstations) my machine
> completely freezes.
>
> Since you have another PCI card you should try a recent kernel
> from CVS which explicitly checks for this combination of c3000 and
> Visualize EG combo and avoids to initialize it. For all other
> combinations of workstations and graphic cards this check isn't
> done and the graphic card will be initialized.
> (PS: This should be added to the 0.9.3 FAQ!)
>
> Helge
>
