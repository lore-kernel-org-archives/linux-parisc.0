Return-Path: <brianbarber@myrealbox.com>
Received: from smtp-send.myrealbox.com (smtp-send.myrealbox.com
	[192.108.102.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FCE14854
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Jan 2004 07:12:33 -0700 (MST)
Subject: Re: [parisc-linux] Installing Debian on an 712/80
From: "Brian Barber" <brianbarber@myrealbox.com>
To: parisc-linux@parisc-linux.org
Date: Mon, 12 Jan 2004 09:12:32 -0500
MIME-Version: 1.0
Message-ID: <1073916752.bd0297c0brianbarber@myrealbox.com>
Content-Type: text/plain; charset="UTF-8"
Cc: 
Reply-To: brianbarber@linux.ca
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

With the older Sun CDROM drive and the full debian-hppa iso, the install wa=
s trivial.  One thing that is really remarkable is the "power on to login=
 prompt" speed.  Everything that I have tried so far works great.  This i=
s a brilliant port.

The only hangup I had was installing XFree86.  I tried installing using x-w=
indow-system, which kept failing with twm as a broken dependency (Depend:=
 twm is needed but will not be installed / Sorry, broken package [sic - g=
oing off the top of my head]).  I installed with x-window-system-core, wh=
ich was successful, and then installed individual packages as required (e=
.g. xterm, xdm, etc.)

Thanks for the guidance on the CDROM drive.  That tip might want to find it=
s way into the install documentation for other PARISC rookies.

Cheers,
BB

PS: Now that I have a working machine, how can I help the development effor=
t?

-----Original Message-----
From: "Brian Barber" <brianbarber@myrealbox.com>
To: parisc-linux@parisc-linux.org
Date: Fri, 09 Jan 2004 16:12:14 -0500
Subject: Re: [parisc-linux] Re: Installing Debian on an 712/80

Good news (for me, that is).  A colleague here at work located an older ext=
ernal Sun CDROM, which I believe supports 512k byte segments.  I'll try a=
n install with it this weekend and send an update when I'm successful. (N=
ote the optimism)

Have a good weekend, everyone.

BB

-----Original Message-----
From: Steve Bromwich <hppa@fop.ns.ca>
To: Matthew Wilcox <willy@debian.org>
Date: Thu, 1 Jan 2004 18:13:13 -0400 (AST)
Subject: Re: [parisc-linux] Re: Installing Debian on an 712/80

On Thu, 1 Jan 2004, Matthew Wilcox wrote:

> On Tue, Dec 23, 2003 at 10:20:01AM -0500, Brian Barber wrote:
>
> > I've done some more digging and come up with the following obstacles:
> > 1) HP machines require active SCSI termination, hence the reason why I =
could not boot from my (borrowed) external SCSI CD-ROM (passive terminato=
r only)
>
> I'm not sure that's true, but they do require certain CD drives to
> boot from.  I forget the details; something to do with 2k vs 512 byte
> sector sizes.

The industry standard (ie, IBM PC world) is 2048 byte sectors, whereas HP
(and Sun) use 512 byte sectors. If you don't have a drive that supports
512 byte sectors, you won't get anywhere. See the post I made (and
subsequent informative posts from others) at
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021645.h=
tml
for more details.

> > If I am correct (jump in here), I am left with bootp/tftp as the only
> > means of booting the machine.  If I take this route, I copy lifimage
> > to the boot directory of my tftp server.  This is where I am stuck.
> > There is no documentation I can find (or discern) that walks one throug=
h
> > an install from a tftp-booted machine.  Is there a way for me to mount
> > the Debain CD via nfs and launch the installer from there?

When you boot via tftp you still need a way to communicate with the box,
either using a keyboard and monitor, or (more commonly) via serial
console. Is this the answer to the question you're asking?

Alternatively, when you boot the lifimage I *think* you get the option of
installing from pre-mounted directory (somewhat useless via serial console
- I don't think there's any way to get a shell prompt to premount a
directory), NFS, HTTP or FTP - ie, the usual Debian install methodology. I
suspect your best bet is over NFS.

> I'd like to just point you at the boot HOWTO [1], but it doesn't seem
> to cover this step.  It only covers booting the kernel, not setting up
> your NFS root.  I've had mixed success with using debootstrap to populate
> a minimal nfsroot, then updating to sid and installing new packages.

One thing I noticed is that the config given is using inetd (I use xinetd)
and appears to be using the "standard" tftp, rather than hpa's tftpd. I
recently set up a diskless J200 (imaginatively named "j200"), the config I
used on the server is as follows:

dhcpd.conf:

allow bootp;
option domain-name "fop.ns.ca";
option domain-name-servers 10.2.1.10;
option log-servers 10.2.1.10;
authoritative;
use-host-decl-names on;

host j200 {
  hardware ethernet 08:00:09:8c:d1:41;
  filename "lifimage";
  server-name "10.2.1.10";
  fixed-address 10.2.1.21;
  option subnet-mask 255.255.255.0;
  option broadcast-address 10.2.1.255;
  option routers 10.2.1.200;
  option domain-name "fop.ns.ca";
  option root-path "10.2.1.21:/j200";
}


xinetd.conf:

service tftp
{
       socket_type     =3D dgram
       protocol        =3D udp
       wait            =3D yes
       user            =3D root
       #server         =3D /usr/sbin/tcpd
       #server_args    =3D /usr/sbin/in.tftpd /tftpboot
       server          =3D /usr/sbin/in.tftpd
       server_args     =3D -v -s /tftpboot
       disable         =3D no
}


One tip I noticed is it takes a dog's age to boot with serial console set
to 9600. If you're going to do a serial console, I'd recommend upping the
rate to 19200.

I'm off to Boston tomorrow for a week and a half, but if you're still
having troubles when I get back I can fire up the J200 and write up a
step-by-step if it'd help.

Cheers, Steve



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
