Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3125A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 14:59:38 -0700 (MST)
Date: Wed, 29 Jan 2003 22:59:32 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Helge Deller" <deller@gmx.de>
Cc: mmehta@elgin.edu, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: X windows setup on C110 with woody and kernel-2.4.20pa22
Message-Id: <20030129225932.6d2392cf.varenet@esiee.fr>
In-Reply-To: <200301292056.36440.deller@gmx.de>
References: <5D69EA3878E6D411B43C00508BFD7283049FB54D@exchange2.elgin.edu>
	<200301292056.36440.deller@gmx.de>
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

On Wed, 29 Jan 2003 20:56:36 +0100
"Helge Deller" <deller@gmx.de> wrote:

> Hi Miten,
> 

> 
> You don't seem to have HIL, but IIRC the ps/2 driver uses the same /dev/input/mice 
> interface.

Well, in 2.4 kernel the PS/2 driver use /dev/psaux, since it doesn't comply with the new input layer. In 2.5, the new driver uses /dev/input/mice.

HTH,

Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
