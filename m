Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Booting diskless Linux machine from HP-UX server ! 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Fri, 28 Dec 2001 00:03:32 +0100." <3C2BA8C4.3C1C2174@gmx.at>
References: <3C2BA8C4.3C1C2174@gmx.at> 
Date: Thu, 27 Dec 2001 23:03:30 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011228060330.5FCDE482B@dsl2.external.hp.com>
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

Christoph Plattner wrote:
> Recently I tried to boot a Linux box (in my case it was a i386, but
> the problem also exists for a PA-RISC box) from an HP-UX server (model
> 9000/856, the E55 running 11.00). The problem was, I could not mount
> a NFS-Root for the Linux box.

It was easier for me to abandon my HPUX NFS server a few years 
back than try to figure this out.

> I analysed the problem, and it seems to be a problem with the MOUNT
> version (not mixed up with NFS version). Linux uses for normal mounts
> MOUNT v3, for NFS ROOT mounts MOUNT v1, which does not include UID and
> GID for example. The NFS Server on the HP-UX machine reports in the
> log (activated to debug level), that the mount request does not include
> UID. So the mount is rejected (EACCES). So I was not able to boot a
> linux box using NFS ROOT from an HP-UX server, but I can boot any Linux
> box (PA-RISC, i386) from a i386-Linux box.

Once upon a time I had NFS root working with HPUX as my server.
Search mail archives in the 1999, early 2000 time frame.

Another basic problem is "mknod" on HPUX works differently than
it does for linux. You have to "cook" the mknod numbers to make them
look right to the parisc-linux client. Again, the parisc-linux mail
archives (soudn familiar? :^/) should be helpful here.

> I hope, you can help here. I think the problem is also interesting for
> others, using a HP-UX machine as NFS server instead a Linux machine.

We are trying to *replace* HPUX servers. ;^)
Obviously not for everything, but simple stuff like this...

grant
