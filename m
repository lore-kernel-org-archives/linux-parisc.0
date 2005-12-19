From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 21:04:48 +0100
Message-ID: <200512192104.48593.deller__47296.9187227592$1416624577$gmane$org@gmx.de>
References: <43971676.1010009@gmail.com> <200512191639.44027.deller@gmx.de>
	<43A6F709.3080008@bizzi.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Fabio Bizzi <fbizzi@bizzi.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43A6F709.3080008@bizzi.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Fabio,

On Monday 19 December 2005 19:08, Fabio Bizzi wrote:
> Helge Deller wrote:
> > I just committed a patch to stifb in kernel 2.6.15-rc6-pa1.
> > Could you please try this one? It works for me... :-)
> 
> I'm sorry, but I didn't undestrand if you have fixed my problem with 
> HCRX-24? :)

Probably not.
Your main problem is that you see this message:

STI GSC/PCI core graphics driver Version 0.9a
     id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI init_graph failed (ret -1, errno 258)
sti: probe of 10:8 failed with error 1

"init_graph" is a graphic card firmware function, which seems to not work on your system.
Some HP firmwares have support to "patch" the graphic card firmware before executing "init_graph".
This is probably not the case for your c200.

So, please check if your machine runs the latest HP-C200 firmware.
For this please read the PARISC-Linux FAQ at http://www.parisc-linux.org/faq/index.html#PDCupdate ("How can I check if the PDC (firmware) revision is the latest?").

Additionally I will try write some patch-code during the next weeks, which might get your card working even on the C200 and other machines. Stay tuned.
 
> If yes the kernel with your patch is aivailable on cvs.parisc-linux.org 
> or I've to patch the source and compile it?

2.6.15-rc6-pa1 is currently beeing built.
During the next hour I assume it should be finished and you may download it from here: http://cvs.parisc-linux.org/download/linux-2.6/
(I assume a B180 might be close to your c200 ?).

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
