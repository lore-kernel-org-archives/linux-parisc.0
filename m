Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EBAE482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 02:30:55 -0700 (MST)
Date: Sat, 1 Feb 2003 10:30:05 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: <adam.sk@groovy.ffloth.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
Message-Id: <20030201103005.42be16f9.varenet@esiee.fr>
In-Reply-To: <002d01c2c9aa$37400140$b601a8c0@pepp>
References: <002d01c2c9aa$37400140$b601a8c0@pepp>
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

On Fri, 31 Jan 2003 20:27:21 -0800
"Adam Skaffloth" <adam.sk@groovy.ffloth.com> wrote:


> The Visualize-EG in C180 seems not be working, seen threads about that,
> so installed the Visualize-24 card from the C110 on the C180 and get the
> same result.
IIRC, Visualize-EG should be working with STIfb driver.

> I also read that their are no trouble with installing on 712/60.
> I got 2, one with the second LAN/Serial Card (So I can use it as a FW).
We have that conf as well, and installed it without any problem.
> Bot are starting but are hanging after the message:
> 
> The Installation Program is determining the current state
> of your system and the next installation step that should
>  be performed.
> 
> It hangs there forever on both boxes.
That's definitely not normal.
How much RAM does these boxes have ?
We noticed that bellow 32MB of RAM, the installer may 'Defunct' during the install process. In that case you would have to install the HD into another box, prepare it and install the software on it, and plug it back into the 712, see the PA-RISC/Linux Boot HOWTO for details (http://pateam.esiee.fr/doc.html)
 
HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
