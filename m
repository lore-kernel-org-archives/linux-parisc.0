Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA6E64879
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 06:46:00 -0700 (MST)
Date: Mon, 2 Feb 2004 14:45:57 +0100
Message-ID: <40153061000055AD@ocpmta1.freegates.net>
In-Reply-To: <200401301954.18808.deller@gmx.de>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] sti & b2k: doesn't work?
To: "Helge Deller" <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>
>Which graphics card do you have ?
>What does "lspci -v" and/or dmesg (look for "sti:") says ?

Hi Helge,

Sorry for delay but during week-end I do not have access to this system ;).

Here are the info:
# lspci -v
[snip]
01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
	Subsystem: Hewlett-Packard Company: Unknown device 108c
	Flags: bus master, 66Mhz, medium devsel, latency 255, IRQ 256
	Memory at fffffff0 (64-bit, prefetchable) [size=16M]
	Memory at fffffff0 (64-bit, non-prefetchable) [size=16M]
	Expansion ROM at fffff800 [size=128K]
[snip]
00:0e.2 USB Controller: National Semiconductor Corporation USB Controller
(rev 02) (prog-if 10 [OHCI])
	Flags: bus master, medium devsel, latency 240, IRQ 193
	Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
	Memory at fffffff0 (32-bit, non-prefetchable) [size=4K]
[snip]

# more /var/log/dmesg
[snip]
STI PCI graphic ROM found at fffffffff4940000 (128 kB), fb at fffffffffb000000
(16 MB)
    id 35acda16-9a02587, conforms to spec rev. 8.0c
    graphics card name: HPA4982A
stifb: 'HPA4982A' (id: 0x35acda16) not supported.
[snip]

hth,
    Joel

PS: for pdc_console on b2k, I don't care for the moment that stifb is not
supported ;)




-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
