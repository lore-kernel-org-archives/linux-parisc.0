From: Julian Stecklina <der_julian@web.de>
Subject: Re: [parisc-linux] Status of parport driver in 2.6.20.1
Date: Thu, 14 Jun 2007 13:56:34 +0200
Message-ID: <46712CF2.1090907__30313.9717354954$1416624393$gmane$org@web.de>
References: <466F3706.3020907@web.de> <466FB64A.5020800@tausq.org>
	<4670269A.1080703@web.de> <46709805.3090001@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46709805.3090001@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph Chung wrote:
> Hrm, all the automatic probing in parport_pc is causing the HPMC. Can 
> you do a quick experiment and boot the kernel with "parport=0"? The 
> SuperIO driver should still register the parallel port.

It does:

SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 19)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 5 [PCSPP]
...
lp0: using parport0 (interrupt-driven).

and CUPS just successfully printed a test page. :) I guess this should 
be documented somewhere. What about a Wiki page about current problems? 
I am happy to provide content about the parport issue and document my 
ALSA experiments, just don't know where to put it.


Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
