Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDD464829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 14:35:07 -0700 (MST)
Date: Fri, 21 Mar 2003 22:34:57 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Cc: markus.schaber@student.uni-ulm.de,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Out of memory problem
Message-Id: <20030321223457.72e980a3.varenet@esiee.fr>
In-Reply-To: <20030321170502.GA8719@dsl2.external.hp.com>
References: <20030321000822.6a0123e0.markus@schabi.de>
	<20030321065534.GA21566@dsl2.external.hp.com>
	<20030321092201.5dcedd9f.markus.schaber@student.uni-ulm.de>
	<20030321170502.GA8719@dsl2.external.hp.com>
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

On Fri, 21 Mar 2003 10:05:02 -0700
grundler@dsl2.external.hp.com (Grant Grundler) wrote:

> On Fri, Mar 21, 2003 at 09:22:01AM +0100, Markus Schaber wrote:
> > I don't want to use the machine for serious work, it's just as a proof

> Offhand I don't know where to find a relatively current parisc NFS Root.
> You could try to copy the contents of the install CD to a local
> directory on an NFS server, hack that up a bit, and export the result.
I think that if you have a debian box handy, there's a far more simple way
to create a root tree ready to export via NFS:

# debootstrap --arch=hppa <release> <export_folder> <debian_mirror>

the --arch switch is only necessary when preparing a root for another arch
than the native one.

for me it was:

# debootstrap --arch=hppa woody foo_root/ http://ftp.de.debian.org/debian

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
