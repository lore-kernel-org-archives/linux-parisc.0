From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Sat, 11 Jun 2005 21:06:54 +0000
Message-ID: <42AB526E.3020508@tiscali.be>
References: <200506072020.j57KKJgU028014@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: kyle@cabal.ca,
 parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506072020.j57KKJgU028014@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

A small update:

John David Anglin wrote:
>>>Sorry it didn't help for me (on a b180 with kernel 2.6.12-rc5-pa2 and 2.6.8/include/asm-parisc/unaligned.h)
>>>still panicing as usual:
> 
> 
> It also didn't help the stability issues that I previously reported
> for my c3750 although the mouse and keyboard now work with 2.6.12.
> 
> 
>>Definitely, the system already hang with 2.6.9-rc2-pa13.
>>As it's a b180, I observe leds on front panel:
>>    o heart bit always flicking, 
>>    o from time to time lan in/out leds flick also,
>>    o power on/off button didn't reach to stop the system
>>    o after that only toc buttom reach to restart the server (fwiw nothing
>>in piminfo?)
OTC 2.6.9-rc2-pa1 works fine (stress test during a full day wihout pb)

:-) : pb didn't come from upstream merge (that reduce also analysis to only some 150k :-) )

[...]

> 
> The system was still pingable, but ssh and the console didn't work.
mmm typical when a system crash: as far as I can observe the nic is only reset when the system reset itself.
So when a system crash, the nic is still configured and icmp trafic (afaik hw level) still respond.

> No heartbeat was observed.
>
That would mean that there is not anymore activity on the system.
Otc of my system where at least some routine (e.g. heartbit) was still running.

Most probably we are facing to different pb.

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
