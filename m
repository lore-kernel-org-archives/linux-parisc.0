Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 994F24841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 10:13:14 -0700 (MST)
Message-ID: <3FB7B032.8050505@tiscali.be>
Date: Sun, 16 Nov 2003 17:13:22 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Damian Muchli?ski <mudamian@poczta.onet.pl>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on HP
References: <002901c3aad6$87fb1c10$64d71399@Damian> <20031116013854.GA3735@colo.lackof.org>
In-Reply-To: <20031116013854.GA3735@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Grant,

Grant Grundler wrote:
> On Fri, Nov 14, 2003 at 06:41:25PM +0100, Damian Muchli?ski wrote:
> 
>>I've found on newsgroup that because of old
>>version of gcc and kernel and I should use newer version. So I have
>>downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
>>website,check md5, burned and booted.
>>Unfortunately it hangs on "searching for devices" without any more info.
> 
> 
> Damian,
> I'm surprised the 2.4.22 netinst.iso doesn't boot on your c3700.
> I'm currently running 2.4.22-pa14 on a C3600 with STIFB console.
> 
Not me, it is the same pb on my b2k:
(see logs in the src thread)
"[...]
NS87415: IDE controller on PCI bus 00 dev 70
NS87415: chipset revision 3
NS87415: 100% native mode on irq 103
     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
hda: HL-DT-ST GCE-8481B, ATAPI CD/DVD-ROM drive
ide0 at 0xf00-0xf07,0xe02 on
hda: ATAPI 40X CD-ROM CD-R/RW drive, 2048kB Cache
[...]"

The question is: is it enough to unplug the ide cable of this ide cdrom 
to make it works?

btw can you have a look in your dmesg to see if you also encounter 
NS87415's messages?

> The output you posted started with 2.4.17 boot and then garbled
> at the end. I don't understand how HPMC dump messages and what looks
> like PDC output (eg "To discontinue search,...") got mixed up.
> 
> If you can netboot a 2.4.22 kernel image from:
> 	ftp://ftp.parisc-linux.org/kernels/c3000/
> 
> and point the "root=" at the CDROM install disk, I would expect
> it to complete the install....but that's non-trivial to setup
> and it's alot to ask for. If you don't have time or it's too
> complicated, don't worry about it.
> 
> I'll try to netboot the netinst.iso that you used at home on a C3000
> and see what happens.
> 
Sorry, I reported this pb a long time ago but between too much test 
about too many things, i miss to trace back this pb (more over iirc 
Matthew mentioned that this Suckio controler could be bugy?).

hth,
	Joel
