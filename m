Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 14 Jul 2003 12:41:01 +0200
Message-ID: <3F0BEA8300001157@ocpmta1.freegates.net>
In-Reply-To: <3F10355C.2080303@tiscali.be>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] [2.5] ns87415 irq
To: "Joel Soete" <joel.soete@tiscali.be>,
	"Matthew Wilcox" <willy@debian.org>
Cc: "Grant Grundler" <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Willy,

>>>Is it possible to backport it to 2.4?
>
>>Already did it as 2.4.21-pa3 -- can you test that?
>
> ooh I do not see this change (sorry), I will so test this patch (just 
> have to ask you to wait Monday because here at home I have not yet 
> recover a parisc box :)

As said I come back to you with a successfull test (well by the way pa4)
as buitin device driver NS87415 :)

But as module same erronious behaviour _as previous_:

(I make the p-l and grant in cc because here i grab much detail info)

palx2000:~# modprobe ns87415
Segmentation fault

palx2000:~# lsmod 
Module                  Size  Used by    Not tainted
ns87415                 2424   1  (initializing)

palx2000 login: NS87415: IDE controller at PCI slot 00:0e.0
NS87415: chipset revision 3
NS87415: not 100% native mode: will probe irqs later
modprobe (pid 332): Illegal instruction (code 8)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 10360000 101f50f4 100ddc00
r04-07  00000000 00028820 103cb870 100ddc00
r08-11  00000000 00000000 00000000 00000000
r12-15  103cc010 00004d38 1d4d3000 00042da8
r16-19  00042da8 00042da8 0004c7f0 00000002
r20-23  00000155 fed30000 fed30000 00000002
r24-27  00000004 00007000 103cb870 102fa010
r28-31  00000000 40000000 1f6dc840 00000000
sr0-3   00000000 0000034c 00000000 0000034c
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10360660 10360664
 IIR: 00002ba7    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 1f6dc000 CR31: 10398000
 ORIG_R28: 103aa59c

I do not really understand why modeprobe do an 'Illegal instruction' (pb
with modeprob or with the actual contents of ns87415.o?

(gcc -v => 3.3.1 20030626 (debian prerelease) and binutils 2.14.90.0.4-0.1)

hth,
    Joel

PS: Is it so important to track this driver as module (if only this platform
need this driver replacing tristate by bool wouldn't be enough?)


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
