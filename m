From: Dennis Clarke <dclarke@blastwave.org>
Subject: HP Superdome possible test
Date: Mon, 16 Apr 2018 22:10:56 -0400
Message-ID: <69f09521-cb31-d42b-ee4e-2d8e7617b93a@blastwave.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
Resent-Message-ID: <HuyT8zBpYxC.A.LJF.TlV1aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/69f09521-cb31-d42b-ee4e-2d8e7617b93a@blastwave.org


mentioned last week :

I will look into what the power issue are.  The serial cable setup is 
trivial but the power isn't.

I'll let you know.


Dennis

ps: three of these standing around : https://i.imgur.com/AcT2EQ2.jpg

----- from debian-hppa@lists.debian.org Sun, 15 Apr 2018 10:34:51 +0200

 > I assume hppa people in Debian (debian-hppa@l.d.o in CC) would 
appreciate testing on such gear.
 > Not sure if those superdomes will work out of the box though.

It really would be interesting if Linux can boot on such machines.

If they don't, I'm pretty sure that I can finish the firmware support in 
Linux to be able to boot in a cell. For that I'd need access to such a
machines via ssh (to a x86 machine for cross-compiling/tftpboot
provisioning) & a serial port to the superdome.

 > I know from my own testing that the following "smaller" machines work 
with Debian GNU/Linux Sid for hppa:
 >
 > * 712/80
 > * c3700, c3750, J5600, rp2470
 > * c8000, rp3440
 >
 > Apart from the rp3440 - and maybe also the 712/80 which showed some 
issue with it's built-in NIC after netbooting the Linux kernel and the OS

What kind of problems?

 > - all machines also work diskless, which could speed up testing for 
you and avoid a manual Debian installation - although this could still 
be interesting.

Helge
