Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c007.snv.cp.net (c007-h011.c007.snv.cp.net [209.228.33.217])
	by dsl2.external.hp.com (Postfix) with SMTP id 21C8A483C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Dec 2001 00:05:59 -0700 (MST)
From: "Justin Hamilton" <JHamilton@Earthling.Net>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Booting diskless Linux machine from HP-UX server ! 
Date: Fri, 28 Dec 2001 02:05:55 -0500
Message-ID: <LDEDJPMKHIOLPMHDAKLFCENJIMAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20011228060330.5FCDE482B@dsl2.external.hp.com>
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

I worked on a project booting i386 based nfs-root Linux boxes off hpux
servers.

Under 10.20 if you boot the same client twice, with no other clients booting
during the mean whilst, it would get permission denied the 1st time, but be
successful the 2nd.

Under 11.00 it would get permission denied every time.

I had a ticket open with HP on this at one time, then we moved the nfsroot
over to AIX and our problem was solved so I never followed up on it.

Also had problems with TFTP & DHCP servers on 11.00. With multiple IP's
assigned to a lan interface, the server responds from the last ifconfig'd IP
(i.e. lan1:2) , but then listens for a reply on the primary IP (i.e. lan1)
while the client is trying to use lan1:2's IP.
I think we just found a similar problem with another server daemon also.
Don't know those details.

Just my $0.02

Justin

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Grant
Grundler
Sent: Friday, December 28, 2001 1:04 AM
To: Christoph Plattner
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting diskless Linux machine from HP-UX
server !


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

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
