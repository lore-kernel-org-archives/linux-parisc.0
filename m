From: Bartlomiej Ochman <fback@fback.net>
Subject: Re: [parisc-linux] [newbie] Where to start from?
Date: Wed, 01 Sep 2004 19:50:32 +0200
Message-ID: <41360BE8.2050209@fback.net>
References: <4135CD63.9040507@fback.net> <4135D78B.8030805@tiscali.be>
	<4135E714.1000004@fback.net> <4135F5CF.2040609@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4135F5CF.2040609@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel Soete wrote:

> mmm in normal operation, can the system run severall hours without pb?

Not only hours, but weeks or months. I didn't have troubles during 
instalation, I think 1.5 years ago, when the disks worked hard too. I 
also think, everything started when glibc upgraded to 2.3... and "old" 
sarge with glibc 2.2 and kernel around 2.4.18 had worked without that 
problem.

> And when system hung, if you wait some minutes (about 3 min iirc), don't 
> you read SCSI BUS RESET messages at the console?
Nothing like that. It dies completly, heart stops beating (all diodes on 
the front panel stops blinking). It doesn't respond to anything.

> Trust me this logic has no sence in electronic: 3 weeks ago we (I mean 
> an Hp engineer) power off a N system to add a FC card, when we try to 
> restart, ...
Yeah, I know. But somehow I feel, this is not hardware-related 
problem... There shuould be some symptoms of disk related problems in 
the dmesg after few weeks of working, but I have nothing like that.

> That said, the final step is to 'TOC' your system when it hung (do you 
> know the bleue button behind your box?)
No?

> then grab the 'ser piminfo' and analyse what you grab on your system 
> when it reboot with 
> <http://cvs.parisc-linux.org/build-tools/dump_analyser.sh>
I'll try this, but not before October or so. I'm currently rather busy 
with my MSc final exam.

Thanks,
BO
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
