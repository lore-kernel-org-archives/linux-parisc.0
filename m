Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42035482D
	for <parisc-linux@parisc-linux.org>; Tue, 13 May 2003 08:39:20 -0600 (MDT)
Date: Tue, 13 May 2003 16:39:14 +0200
Subject: Re: [parisc-linux] System hanging
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: <parisc-linux@parisc-linux.org>
To: Richard Todd <rtodd@antipentium.com>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <BAE67049.B2B%rtodd@antipentium.com>
Message-Id: <AB345DD8-8550-11D7-AFCE-0030656F07A2@esiee.fr>
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

cat /proc/version please (ie: did you build your kernel with gcc 3.2.2?)

I've been running 12days straight of building gcc in loop while having=20=

2 setiathome instances running on a J5000 with 512M of RAM and=20
experienced no hangs, that was with 2.4.20-pa18 SMP 64bit, built with=20
gcc 3.0.4...

oh, and fwiw:
http://www.fr.parisc-linux.org/faq/kernelbug-howto.html


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le mardi, 13 mai 2003, =E0 15:50 Europe/Paris, Richard Todd a =E9crit :

> Hello all,
> I am currently running on a J5000
> 2000 root # uname -a
> Linux k2000 2.4.20-pa35 #2 SMP Sat May 10 10:36:26 EDT 2003 parisc=20
> unknown
> unknown GNU/Linux
>
>
> This issue I am having is during compiling andthing big the box has a
> tendency to just hang hard meaning power cord reboot. Has anyone seen=20=

> this
> before. I have a gig of ram and it does not seem to be a memory issue.=20=

> I am
> currently compiling KDE and it just hangs the box every now and =
then...
> Anyone ?=20=
