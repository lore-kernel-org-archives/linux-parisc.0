Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B4084829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Jan 2003 14:23:17 -0700 (MST)
Date: Mon, 6 Jan 2003 22:22:58 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Steve Cornett" <stevec@bullseye.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
Message-Id: <20030106222258.2eec3889.varenet@esiee.fr>
In-Reply-To: <000001c2b5c2$add00810$a87ba8c0@steve>
References: <20030104193515.19808d5a.varenet@esiee.fr>
	<000001c2b5c2$add00810$a87ba8c0@steve>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 6 Jan 2003 12:32:05 -0800
"Steve Cornett" <stevec@bullseye.com> wrote:

> Thibaut,
> 
> Thanks for your answer, I was able to install using
> palinux-2.4.20-pa13-PDC-20021211-netinst.iso.
That's good news, and means that b-f on 3.0r1 doesn't suit your HW.
> 
> Now I've a different problem and not sure where to turn.  Whenever I
> compile and run a program that "throw"s an exception, I get "Memory
> fault".  I can't figure out where to report this problem.  The PARISC
> Linux people or the GCC people?
I'd say PARISC for two reasons:
- first, this is quite likely to be a kernel problem, and IIRC exception related stuff is worked on currently,
- secondly, because some of GCC folks are also PARISC m-l readers ;)

FWIW, please read FAQ #17 for kernel error reports.

Anyway, please always CC the m-l on such answer: if I haven't answered to that mail, those fellow pa-ckers would never have known 3.0r1 B-F were responsible for the trouble...

HTH,

Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
