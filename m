Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Mon, 27 May 2002 14:49:24 PDT." <Pine.LNX.4.44.0205271438590.11012-200000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0205271438590.11012-200000@garibaldi.apptechsys.com> 
Date: Tue, 28 May 2002 11:07:57 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020528170758.16D13482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> I'll try.  BTW, the HPMC only happens sometimes.  Most of the time it just 
> hangs.  But HPMC starts if I hit the button on the back and let it boot.

ok. This is an interesting symptom.

...
> General Registers 0 - 31
> 00-03   0000000000000000  0000000a44b3921e  0000000000019bf0  00000000f400400
>   0

GR02 is the return pointer - but it's not a kernel address.
Possible PDC or something else.

...
> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x0000000000019bf8

IIA is the instruction pointer. Also not a valid kernel address.
It's possible we are getting a "double fault" and the first
one is overwriting the original HPMC.

> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x0030103b
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00000000
> System Responder Address     = 0x000000fff4004014
> System Requestor Address     = 0xfffffffffffa0000

This is useful. The system *probably* died trying to access 0xf4004014.
I could try to look up CPU State but I'm out of time.


Here are the next steps:
1) figure out who is touching 0xf4004014.
   I didn't see anything in the console output.
   (http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016342.html)
   Can you look in /proc/iomem?
   My C3000 has:
   f4000000-f4ffffff : LBA PCI LMMIO
     f4007000-f4007fff : usb-ohci
     f4008000-f40083ff : tulip

2) figure out if the access is because of bad DMA killing the IOMMU
   or just the chip not responding.

It remotely possible the latest commit I made will affect this problem.
Can you retry with -pa28 (or -pa29)?

grant
