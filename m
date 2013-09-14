From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: C8000 / PA8800 64-bit SMP with kernel 3.11.0 - HPMC in
 cpu_startup_entry while setting promiscuous mode on eth
Date: Sat, 14 Sep 2013 15:45:24 +0200
Message-ID: <20130914154524.1880f412@marga.jer-c2.orkz.net>
References: <20130913182705.6d8471ae@marga.jer-c2.orkz.net>
	<1379090996.2198.3.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1379090996.2198.3.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 13 Sep 2013 09:49:56 -0700
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Fri, 2013-09-13 at 18:27 +0200, Jeroen Roovers wrote:
> > Resending since it apparently never got through (binary
> > attachment?)...
> > 
> > While running tcpdump or wireshark (dumpcap) and setting promiscuous
> > mode on eth0, I get an HPMC in cpu_startup_entry.

I forgot to note that this does not happen every time.

> Translation of the kernel addresses from %rp (0x4018eb0c), and the
> two IAOQ entries (0x0, 0x4018eb24).  Since the first IAOQ entry is
> zero, whatever is at the second seemed to trigger a jump to a NULL
> pointer.

000000004018e9b0 W arch_cpu_idle
000000004018e9e0 T cpu_startup_entry
000000004018ec68 T freezing_slow_path

http://rooversj.home.xs4all.nl/gentoo/hppa/System.map

Is this useful in any way?


     jer
