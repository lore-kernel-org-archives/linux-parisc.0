From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 21:57:59 +0100
Message-ID: <200512192157.59926.deller__27142.5084364184$1416623959$gmane$org@gmx.de>
References: <43971676.1010009@gmail.com> <20051219170717.GA1464@ntlworld.com> <20051219203048.GA2197@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Stuart Brady <sdbrady@ntlworld.com>,
 debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20051219203048.GA2197@ntlworld.com>
Resent-Message-ID: <7E3LWB.A.5Y.j7xpDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Monday 19 December 2005 21:30, Stuart Brady wrote:
> > Ooh!  I'll test this...  Unfortunately, I'm compiling on a 715/100 so
> > bear with me for a moment. :)

BTW, I'm doing all PA-Linux development on my Athlon desktop and cross-compile the parisc-linux kernel (e.g. with ftp://ftp.parisc-linux.org/x86-xcompilers/xc-20040917-hppa32.tgz).
Then the Athlon PC runs a tftp-server and services the built kernel to the parisc servers. The kernel boots, but then has it's root directory on the local hard disk.
It's way faster than native compilation, and as benefit I can boot all my parisc machines with this one single kernel (build once, boot everywhere ;-)).

Helge


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
