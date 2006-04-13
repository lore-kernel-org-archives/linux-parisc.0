From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re:[parisc-linux] "BUG: soft lockup detected on CPU#0" on recent
	64bit k-2.6.16 (up or smp)
Date: Thu, 13 Apr 2006 07:45:45 +0100
Message-ID: <IXNES9$1FC408083B06CF3616F90EC3F405A12F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello pa*,
> 
> Just to report some "BUG: soft lockup detected on CPU#0":
> on b2k testing k-2.6.16-pa4 64bit up:
> BUG: soft lockup detected on CPU#0!
> 
[snip]

>  IAOQ[0]: _read_lock+0x18/0x30
>  IAOQ[1]: _read_lock+0x8/0x30
>  RP(r2): send_group_sig_info+0x3c/0xb0
> 
> (on this system also with a previous k-2.6.16-rc4-pa1-n4kmp without act=
ivity
> then waiting my request ;-) )
> 
Hi all,

Could that be the result of the upstream bug:
<http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.16.4>

At least in the way; I will test it ...

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
