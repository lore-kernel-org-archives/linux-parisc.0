Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2848482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 12:18:22 -0600 (MDT)
Date: Wed, 9 Jul 2003 19:17:37 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	<parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3F0571860000097D@ocpmta8.freegates.net>
Message-ID: <Pine.LNX.4.44.0307091825210.2022-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 SCSI config, was Re: linux grundler
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

On Wed, 9 Jul 2003, Joel Soete wrote:

> >>> Builds/links/boots using my c3000 .config.
> >
> >Same here. Not dying under load either :)
> >
> >c.
>
> hmm i tested successfully NS87... builtin but failed as module:
> modprob do a page fault and lsmod shows me a module 'busy' and so the system
>
> ailled to reboot (only power off button works but fs were so not cleanly
> umount :( )

A little bit offtopic, but since you are speaking of C3000 and SCSI:


I replaced my buggy C240 with a C3000 (and got into more debts ;-/) and
it's working fine so far (fresh CVS co of 2.4.21-pa2).

Even Wireless network card (Netgear MA311, Prism chipset, full PCI, not
PCI-PCMCIA or PLX) works using the hostap driver (and in hostap mode)!!!

However don't try to use the kernel driver (orinoco/hermes), it seems
unstable, at least when the reception is not good or when transferring
huge files (kernel emits lots of warnings and makes it unresponsive)


My problem:

I was (only) using a external SE SCSI drive on my C240, so it was easy to
get the C3000 running: simply attach the SCSI box to it, and then copy
all the files onto the internal FW LVD SCSI drives of the C3000.

Well, the C3000 is very stable when just using the external SE SCSI, but
when trying to access the internal FW SCSI, it often aborts SCSI commands
and frequently resets (at least) the FW SCSI BUS, at least when trying to
copy large directories from SE SCSI to FW SCSI.

The machine has 1GB RAM, 2x 9GB LVD FW Seagate 9GB disks, no IDE cdrom,
no graphics.

I'm using the SYM2 driver (using default options), but I tried a
2.4.20-pa35 kernel with SYM1 and I had the same problems. I don't have my
config here, but I'm sure I've compiled the kernel with "Zalon" support,
since it's not clear to me, after reading the help, whether I need it or
not.

Can somebody give me his .config for a C3000 and can tell which driver to
use (SYM1 or SYM2)? Are there some kernel arguments neccessary for the
C3000?


Thanks, Max
