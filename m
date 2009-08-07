From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Fri, 7 Aug 2009 10:36:28 -0600
Message-ID: <20090807163628.GB18373@lackof.org>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca> <Pine.SOC.4.64.0907302054100.20870@math.ut.ee> <4A724818.4080909@tausq.org> <Pine.SOC.4.64.0907310923520.710@math.ut.ee> <20090805174507.GB11458@lackof.org> <Pine.SOC.4.64.0908052241550.4076@math.ut.ee> <20090806141542.bf48febf.berndg@fsim-ev.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Bernd Gietzelt <berndg@fsim-ev.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090806141542.bf48febf.berndg@fsim-ev.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Aug 06, 2009 at 02:15:42PM +0200, Bernd Gietzelt wrote:
> I've done some test with actual and older kernels from debian because
> my system shows the same behavior.
...
> 2.6.30-1-parisc64 	SERR & PARITY 

Bernd,
BTW, this output has the same issue as the -smp where
the GSP is printing PDC chassis codes/info instead of
kernel output.

...
[   11.924000] sym53c8xx 0000:38:00.0: enabling device (0000 -> 0003)
[   11.940000] sym53c8xx 0000:38:00.0: enabling SERR and PARITY (0003 -> 0143)

************* SYSTEM ALERT **************
SYSTEM NAME: rfhinf238
DATE: 08/06/2009 TIME: 09:32:34
ALERT LEVEL: 7 = reserved
...
0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006D07 06092022 - type 11 = Timestamp 08/06/2009 09:32:34
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:a
*****************************************

the 0x6292 indicates this is an HPMC and you've included the PIM dump
so we shouldn't need anything else at the moment. If you want
to retry with "pdcchassis=0", it would be nice to have the complete
output but I don't think it's required (yet).

I'm pointing this out since the symptom in your listing should
be "HPMC in foo()" where we look up the "IIA Offset"
(0x000000004029d6ac) in the System.map file.
(See "a.c" in http://cvs.parisc-linux.org/build-tools/ to help)

It's also good to look up GR02 (0x000000000c1d5448) at the
same time though GR02 not always as useful.

I forgot how to look up the symbol for modules since HPMC's
after /sbin/init has started often occur becuase of additional
kernel modules getting loaded or NIC interfaces are initialized
when ifconfig'd. Tulip is a suspect in this case.

thanks again,
grant
