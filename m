From: Kyle McMartin <kyle@engsoc.org>
Subject: Re: [parisc-linux] A couple of minor patches for 2.6.7-pa1
Date: Fri, 18 Jun 2004 23:41:16 -0400
Message-ID: <20040619034116.GF12572@engsoc.org>
References: <40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
	<35844.127.0.0.1.1087594933.squirrel@www.puszczka.com>
	<20040618212600.GB12572@engsoc.org>
	<35884.127.0.0.1.1087595933.squirrel@www.puszczka.com>
	<20040618215310.GD12572@engsoc.org>
	<20040619012855.GM20511@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040619012855.GM20511@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 19, 2004 at 02:28:55AM +0100, Matthew Wilcox wrote:
> -cflags-$(CONFIG_PA7300LC)      += -march=1.1 -mschedule=7300
> +cflags-$(CONFIG_PA7300LC)      += $(call check_gcc,-march=1.1 -mschedule=7300,-march=1.1 -mschedule=7100LC)
> 
This works, but only if -Werror is passed to gcc as well, otherwise, it
only generates a warning and goes undetected. Without -Werror, the
kernel compile should succeed, as where it died before would be built
with 7100LC this way, though I'm unaware of the effect of mixing gcc
optimizations like this...

Regards,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
