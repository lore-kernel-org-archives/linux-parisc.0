From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [newbie] Where to start from?
Date: Wed, 01 Sep 2004 16:16:15 +0000
Message-ID: <4135F5CF.2040609@tiscali.be>
References: <4135CD63.9040507@fback.net> <4135D78B.8030805@tiscali.be>
	<4135E714.1000004@fback.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc <parisc-linux@lists.parisc-linux.org>
To: Bartlomiej Ochman <fback@fback.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4135E714.1000004@fback.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Tx BO,


Bartlomiej Ochman wrote:
> Joel Soete wrote:
> 
>> Just to be sure that I well understand: do you mean that you tried the 
>> same operation when runing 2.4.x and 2.6.x?
> 
> Yes, I tried to untar kernel source both under 2.4 and 2.6. No 
> difference, if it was stock, or custom compiled kernel. It hangs 
> randomly under heavy disc load.
> 
mmm in normal operation, can the system run severall hours without pb?
(in case of over heating (fan hs), system quartz failure, ...)

And when system hung, if you wait some minutes (about 3 min iirc), don't you read SCSI BUS RESET messages at the console?

That said, it would make me thought to a pb I encounter with my c110 (exactely the same decription) but the driver pb was 
ncr53c720 (not concerned here) and for some 2.6 only (no pb with 2.4)
>> The very first step would be that you send us a dmesg.
> 
> Attached. This particular kernel seems to be most stable on my machine, 
mmm I just noticed:
...
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
Don't recognise Cujo at address 0xf1000000, not enabling workaround
Cujo: No PCI devices enabled.
...

duno if it's important or not?

> 
> I've double checked this, but everything seems to be fine.
> 
Nice :)

>> If you still have a diagnostic hp cd, boot with this one and check the 
>> disks.
> 
> I'll try to figure out this, but I'm afraid the only CDs we have are 
> with HP-UX 10.20 :(
> 
Iirc it should stand on "hpux Support+" cd

> This machine worked as network monitoring station with HP-UX/HP OV on 
> it, it has never reported any problems with any disk.
> 
Trust me this logic has no sence in electronic: 3 weeks ago we (I mean an Hp engineer) power off a N system to add a FC card, when 
we try to restart, ...
too bad the boot disk was definitively HS (even thought we check it carefully with mstm before shutdown: the disk never presents 
any pb before?)

That said, the final step is to 'TOC' your system when it hung (do you know the bleue button behind your box?)
then grab the 'ser piminfo' and analyse what you grab on your system when it reboot with 
<http://cvs.parisc-linux.org/build-tools/dump_analyser.sh>

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
