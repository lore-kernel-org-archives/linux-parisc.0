Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 02EC44830
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 03:09:11 -0600 (MDT)
Message-ID: <3EF17DEF.1050803@bluehash.de>
Date: Thu, 19 Jun 2003 11:10:07 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
References: <3ED70CF1000076E9@ocpmta2.freegates.net>
In-Reply-To: <3ED70CF1000076E9@ocpmta2.freegates.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi,

>Do you already try to rebuild and re-try a kernel without this support?
>
>Joel
>  
>
this was also my thought, so recompiled kernel without md-support. I 
just rebooted the machine with the new kernel.... Same problem at 
another place:

----------------SNIP-----------

    Keyboard initialization sequence failled
    input: PS/2 keyboard port at 0xf0108000 (irq 69) found and attached
    input: PS/2 mouse port at 0xf0108100 (irq 69) found and attached
    HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
    HP SDC: New style SDC
    HP SDC: Revision: 1820-4784
    HP SDC: TI SN76494 beeper present
    HP SDC: OKI MSM-58321 BBRTC present
    HP SDC: Spunking the self test register to force PUP on next
    firmware reset.
    HP SDC MLC: Registering the System Domain Controller's HIL MLC.
    oprofile: using timer interrupt.
    Badness in local_bh_enable at kernel/s1012503c>]  [<101615dc>] 
    [<10124f10>]
     [<1028ab94>]  [<10494>]
    <4> [<10210468>]  [<10124b3c>]  [<1018abf8>]  [<10124cc8>]
    ftirq.c:109
    Kernel addresses on the stack:
     [<10124ed8>]  b1f0>]  [<101070f8>]  [<1028c0d8>]  [<1028c20c>]
     [<10128c68>]  [<1020dd68>]  [<101e493c>]
    <4> [<10210468>]  [<10124b3ck:
    <4> [<10124ed8>]  [<10105ab8>]  [<101289a8>]  [<1028a9d03b83c8>] 
    [<10399494>]  [<10100284>]
     [<10109c5c>]
    Badnes  [<101615dc>]  [<10124f10>]
    <4> [<1028ab94>]  [<103b83c8>]> [<101e0f5c>]  [<1012503c>] 
    [<101615dc>]  [<10124f10>]
     [1020dd48>]  [<10210498>]
    <4> [<10210468>]  [<10124b3c>] c5c>]
    <4>HP SDC: Transaction add failed: transaction already queuedl
    addresses on the stack:

-----------------SNAP----------------

The interesting thing could this line:  "oprofile: using timer 
interrupt." I think in using the timer interrupt lies the problem. 
Doesn't the md-stuff  use also the timer-interrupt to measure the 
throughput with various registers?

Rüdiger
