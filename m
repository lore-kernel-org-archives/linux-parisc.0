From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] NIC & "searching for devices"
Date: Sat, 26 Feb 2005 14:17:21 +0000
Message-ID: <422084F1.1070404__29428.0674811036$1416624536$gmane$org@tiscali.be>
References: <e6eae02905022122345edc35f7@mail.gmail.com>	
	<420B30A200004CEC@mail-1-bnl.tiscali.it>
	<e6eae02905022222484ae1fdad@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Harry Cochran <h.cochran@comcast.net>,
 parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Max Grabert <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae02905022222484ae1fdad@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Max,

Max Grabert wrote:
> On Tue, 22 Feb 2005 10:34:46 +0100, Joel Soete <soete.joel@tiscali.be> wrote:
> 
> [....]
> 
> 
>>Yes but I encountered weird difficulties (even on a i386 box) 
>>to configure a brother model 3C905B as needed:
>>see this old thread <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021619.html>
> 
> 
> kargellan:/home/xam# lspci
> 0000:00:0d.0 Ethernet controller: 3Com Corporation 3c905C TX/TX-M
> [Tornado] (rev 78)
> 0000:00:0e.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX
> [Cyclone] (rev 30)
mine was far older as far I could judge it was only a (rev 24)?

> 0000:00:0f.0 Ethernet controller: 3Com Corporation 3c905C-TX/TX-M
> [Tornado] (rev 78)
> [...]
> 
> As you can see this is a ix86 machine with three 3com NICs
> in it; It is running stable for almost 2 years now.
Right but atm I was still running 2.4 (I only start 2.6 later in late May 2004).
Event thought there was already some patch available for 2.4, I was a bit lazy and prefer to replace nic by another :-(
(my bad, I don't remember where did I save it to make new test, grrr)

> Right now it is
> running 2.6.11-rc4. BTW, all three network cards share one
> interrupt (IRQ 11), which is also used by the USB port.
> 
> And there is also my ix86 laptop that is using a 'vortex' network
> card, also running fine for almost 3 years now with many 
> different linux kernel.
> 
> I'd rather say either your network card is broken/of poor quality
mmm I would like to find back (just for the fun)

> or there are some compatibility issues with your ix86  motherboard.
or should just required a fw upgrade (if possible) or use more recent driver of 2.6?

> Anyway, this is going way off-topic ...
> 
Obviously, but the most anoying is that I lake of time right now (in prod we have to resurect a proj frozen during last three years 
and so required a lot of work to update: middle ware first, then os update and finlay hw and its corresponding os (hpux-11.11 in 
fact for new rp3xxx to replace oldtimer as D and K class :-) ).

> 
> In my experience 3Com often produced okay-nice cards, but
> sometimes they managed to release utter crap as well.
mmm I didn't suspect hw but may be fw or driver?

> IMHO there are better alternatives available (Intel/DEC), 
> where I don't have to take any risks.
>
Cool advise ;-)

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
