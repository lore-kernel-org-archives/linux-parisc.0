From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] NIC & "searching for devices"
Date: Wed, 23 Feb 2005 06:48:31 +0000
Message-ID: <e6eae02905022222484ae1fdad__32045.2714841396$1416624535$gmane$org@mail.gmail.com>
References: <e6eae02905022122345edc35f7@mail.gmail.com>
	<420B30A200004CEC@mail-1-bnl.tiscali.it>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Harry Cochran <h.cochran@comcast.net>,
 parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <420B30A200004CEC@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 22 Feb 2005 10:34:46 +0100, Joel Soete <soete.joel@tiscali.be> wrote:

[....]

> Yes but I encountered weird difficulties (even on a i386 box) 
> to configure a brother model 3C905B as needed:
> see this old thread <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021619.html>

kargellan:/home/xam# lspci
0000:00:0d.0 Ethernet controller: 3Com Corporation 3c905C TX/TX-M
[Tornado] (rev 78)
0000:00:0e.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX
[Cyclone] (rev 30)
0000:00:0f.0 Ethernet controller: 3Com Corporation 3c905C-TX/TX-M
[Tornado] (rev 78)
[...]

As you can see this is a ix86 machine with three 3com NICs
in it; It is running stable for almost 2 years now. Right now it is
running 2.6.11-rc4. BTW, all three network cards share one
interrupt (IRQ 11), which is also used by the USB port.

And there is also my ix86 laptop that is using a 'vortex' network
card, also running fine for almost 3 years now with many 
different linux kernel.

I'd rather say either your network card is broken/of poor quality
or there are some compatibility issues with your ix86  motherboard.
Anyway, this is going way off-topic ...


In my experience 3Com often produced okay-nice cards, but
sometimes they managed to release utter crap as well.
IMHO there are better alternatives available (Intel/DEC), 
where I don't have to take any risks.


Greetings,
  Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
