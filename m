Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8824C4842
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 09:03:16 -0700 (MST)
Date: Sun, 26 Jan 2003 17:03:14 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Buffalo Bill" <buffalo@gediegos.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with Woody on 710.
Message-Id: <20030126170314.2a4af25b.varenet@esiee.fr>
In-Reply-To: <1043595882.23219.12.camel@jupiter>
References: <1043595882.23219.12.camel@jupiter>
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

On 26 Jan 2003 16:44:40 +0100
"Buffalo Bill" <buffalo@gediegos.de> wrote:

> Hi,
> 
> after searching the mailing list I've found some messages which
> reported success in installing Woody on a 710. So I tried to install
> it. After trying many many different lifimages, all ended up in the
> same result: It hung during installation ( while mounting the root
> file system ). Switching to another console ( which still worked )
> showed me that/sbin/dbootstrap and [scsi_eh_0] were both in state D.
If you can switch to another console then the system _isn't_ hung.

I saw the same kind of problem on boxes with low amount of RAM (<32M).
Though the fact that [scsi_eh_0] is in D state isn't good at all. Maybe
you have a problem with your SCSI chain (hard disk, termination
problem...?)

> 
> What did I do wrong ? Or to put it other words: How did you guys get
> your 710s up'n'running ?
The 710 we have running here runs a preinstalled filesystem. That is to
say, the HD was prepared in another box and then plugged back into the
710.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
