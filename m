From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Fri, 22 Jul 2005 13:35:25 +0000
Message-ID: <42E0F61D.5030001@tiscali.be>
References: <200507212243.j6LMhhtD010420@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: carlos@systemhalted.org,
 parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507212243.j6LMhhtD010420@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>just a small note, iirc Bruno's patch also used -ggdb compile option which grow dramaticaly the kernel size.
>>But may be not not absolutely necessary?
> 
> 
> The option adds debug symbols but they all should be in no-load sections
> (i.e., the option shouldn't change the code and data sections at all).
cool ;-)

> If you are going to use gdb to debug the kernel,
I though that was the goal: grab a coredump to trace it back?
(but I could never experiment it because of it's so big size: iirc about 60Mb for the 2.4 and this time my dump (swap) area was too 
small to host the coredump image, now it could be just large enough ;)

> I recommend building
> with -O1 instead of -O2.
> 
mmm could it not be too much invasive?
I mean we are going to change completely the insn flow and btw the time diagram as I experiment:
some weeks ago, I was working on ccio-dma for 64bit kernel on a d380 on which I noticed a dramtic slow down of the boot (more then 
an hour in place of 5 min for its 32bit twin).
I would so first check the reserved IO addresses by some printk but there are so much that I could never get a login prompt (even 
after a long night)?
I so tried to get the only 100 first ones but the kernel still slow down at the same place.
So I so tried to grab the next 200 ones: by miracle it boot near normaly (just slow down by some printk?
(I so presume that there is some race case in this driver, the computed IO adresses wouldn't have to change because I asked to print 
it?)
But I changed the time diagram and btw the kernel behaviour, though?

May be in a second stage, when we would have located the hang place with -O2?

Thanks,
	Joel

PS: I will check that when I will be back from holidays in 15 days ;-)


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
