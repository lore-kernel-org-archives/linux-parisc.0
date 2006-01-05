From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Wed, 4 Jan 2006 23:08:03 -0500
Message-ID: <000601c611ad$a02a50e0$3401a8c0@POGO>
References: <20060104181854.GE20079@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Grant Grundler'" <grundler@parisc-linux.org>,
 "'Matthew Wilcox'" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060104181854.GE20079@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I forgot about the built-in LAN port.  I moved the cable to that one and all
was working from HP-UX, so I restarted the Debian install from CD... it sure
works much better now!!!! The installer doesn't ask for the network info
anymore (i.e. got an IP address from DHCP and did not ask for DNS info,
gateway, etc.), automagically selected eth1 (I guess that implies that eth1
is the built-in and eth0 is the card), and no longer whines about not being
able to reach security.debian.org.

The installer has been busily installing packages for at least 3 hours.  

1. Blew up / hung once on:
Setting up libatk1.0-0 (1.8.0-4) ...
module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ff3fffd
in 17 bits).

2. Power cycled, booted
I get the "module ipv6..." errors when portmap, PostgreSQL, and Apache2
daemons start.

3. Restarted install via "apt-get -f install".  This is my first attempt at
Debian, so I am not APT literate.  This is just what I was prompted to do
when I tried to install one package.

Installer is still chugging.

This appears to be a good sign.


-----Original Message-----
From: parisc-linux-bounces@lists.parisc-linux.org
[mailto:parisc-linux-bounces@lists.parisc-linux.org] On Behalf Of Grant
Grundler
Sent: Wednesday, January 04, 2006 1:19 PM
To: Matthew Wilcox
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On Wed, Jan 04, 2006 at 10:49:43AM -0700, Matthew Wilcox wrote:
...
> > 0000:00:03.0 is tulip in slot 3.
> > 0000:01:14.0 is tulip built-in. (my guess)
> 
> I disagree.  The 'Cujo' on GSC bus 8 is actually a Dino.  As I said
> in my earlier mail, I've now fixed this.

I couldn't tell if the names were wrong offhand - needed ioscan output
(got it) and compare. Thanks for fixing this.

> So I think eth0 (00:03.0) is actually the built-in one.

I think I got this right despite PCI controller names.
Workstations typically hardwired the PCI slot to use the same device
number (e.g. 3) as what is silk screened on the back of the machine.
Built-in devices were typically given numbers much greater than the
highest slot number.

Servers never did this just because that scheme doesn't work multi-cell
systems with > 32 PCI slots (e.g. superdome) or multiple IO bays with
identical silk screened slot numbers.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
