Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (12-231-234-80.client.attbi.com [12.231.234.80])
	by dsl2.external.hp.com (Postfix) with SMTP id E9CD4482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 15:09:34 -0700 (MST)
Date: Thu, 21 Nov 2002 14:09:30 -0800
From: Chris Jantzen <chris-parisc@maybe.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 not booting Sarge kernel
Message-ID: <20021121220930.GF23152@maybe.net>
References: <20021121090154.GB23152@maybe.net> <Pine.LNX.4.44.0211210831370.23497-100000@wolf.alaskatech> <20021121090154.GB23152@maybe.net> <20021121135754.GA3811@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0211210831370.23497-100000@wolf.alaskatech> <20021121135754.GA3811@systemhalted>
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

On Thu, Nov 21, 2002 at 08:57:54AM -0500, Carlos O'Donell wrote:
> > FYI, my sarge-based C180 has not been able to boot 2.4.19-32_18 or _22.1;
> > I have to interact with IPL and fall back to 2.4.18_62.2. It gets as
> > far as the "...if this is the last message you see..." and I never hear
> > from it again, even on the network. And I think after a very very long
> > time, it falls back to firmware. At least, I see DHCP requests coming
> > out of it after a while. (I only just hooked up serial console to
> > interact with IPL after getting no response. No I don't boot it up too
> > often, it's a "side project".)
> 
> HP hardware is occasionally quirky :}
> 
> > Also, "uname -a" segfaults.
> 
> That bug got squashed in unstable. You'll see the fix soon.
>  
> > I'll try unplugging the GSC and EISA cards plugged into it tomorrow.
> > I'll also try letting it just sit there under supervision and see what
> > really happens.
> 
> Good idea :)
> If it doesn't work, get back to the list.

Well, after leaving 22.1 running, it does appear to come up after a
while. About 20 minutes. I am rather certain 18 never booted. Taking all
the expansion cards out does not make any difference.

After doing this, it occurred to me that maybe this was the bus walk
issue that I had ignored on the mailing list from a week ago. :-)

On Thu, Nov 21, 2002 at 08:34:38AM -0900, Tom wrote:
> "They" swear this has a fix in 2.5, but I just let it take it's time and
> all seems happy...

Well, we'll have to keep on them, eh? :-)

While I have somebody's attention: I have some EISA 3c597's that I'd
like to use in this machine. I carefully compile the kernel module with
the same parameters and install it and all I ever get is:

ryoko:~# modprobe 3c59x
3c59x: Donald Becker and others. www.scyld.com/network/vortex.html
3c59x: 3Com EISA 3c590 Vortex 10Mbps at 0x1000. Vers LK1.1.16

ccio-dma.c:638: Assertion dev failed!
Kernel panic: dev

Message from syslogd@ryoko at  Thu Nov 21 09:47:32 2002 ...
ryoko kernel: Kernel panic: dev

I don't get any kind of "HMPC" or register dump or anything else. Just
sits there and stops responding.

Is it ever possible that these cards would work in PA-RISC? They
certainly fit in the slot (;-)), and don't have any x86 code on them. Or
do I need to buckle down and buy a replacement backplane and go PCI?

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
