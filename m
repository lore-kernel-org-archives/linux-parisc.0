From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] "BUG: soft lockup detected on CPU#0" on recent
	64bit 	k-2.6.16 (up or smp)
Date: Sun, 02 Apr 2006 11:23:17 +0000
Message-ID: <442FB425.6000308@tiscali.be>
References: <IX00XW$54609265F67FD22980DB5BAA9486A0DB@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IX00XW$54609265F67FD22980DB5BAA9486A0DB@scarlet.be>
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
> Hello pa*,
> 
> [snip]
> 
>>also noticed on n4k runing k-2.6.16-pa0 64bit smp kernel:
>>BUG: soft lockup detected on CPU#0!
>>
> 
> [...]
> 
>> IAOQ[0]: _read_lock+0x18/0x30
>> IAOQ[1]: _read_lock+0x8/0x30
>> RP(r2): send_group_sig_info+0x3c/0xb0
>>
> 
> This kind of hung re-occured on this n4k (64bit smp kernel 2.6.16-pa8);
> 
> I just grab the piminfo but useless:
> [...]
> Parse IAOQ = 0x000000ffff80ff3c for CPU[1]
> 
> Func: _end, Off: 0xffef1f1244, Addr: 0xffff80ff3c
> [...]
> 
> Parse IAOQ = 0x00000000000006c4 for CPU[3]
> 
> [...]
> 
> Sorry,
>     Joel
> 
> PS: I just start the same test but without CONFIG_DETECT_SOFTLOCKUP :<?
> 
well never the less system still hanging after only:
top - 09:04:58 up 1 day, 16:26,  3 users,  load average: 2.40, 2.26, 2.20

training the same test (kernel build in loop)
(just this time without "BUG: soft lockup detected on CPU#0!" msg?)

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
