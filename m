From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Mon, 26 Feb 2007 13:43:51 -0600
Message-ID: <1172519031.3344.31.camel__22334.4293692664$1416624319$gmane$org@mulgrave.il.steeleye.com>
References: <200702260033.l1Q0Xn44025896@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702260033.l1Q0Xn44025896@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-25 at 19:33 -0500, John David Anglin wrote:
> This one is less stable your previous change + reversion of tausq's
> SMP TLB opimization patch.  GCC build doesn't get far before wierdness
> occurs (strange characters being read from files):
> 
> gcc -c -g -fkeep-inline-functions      -gnatpg -gnata -I- -I. -Iada -I../../gcc/
> gcc/ada ../../gcc/gcc/ada/exp_ch6.adb -o ada/exp_ch6.o
> /tmp/ccaWBgD1.s: Assembler messages:
> /tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
> /tmp/ccaWBgD1.s:2436: Error: Field out of range [0..31] (-1).
> /tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
> /tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
> /tmp/ccaWBgD1.s:2436: Error: Field out of range [0..31] (-1).
> ...

Hmm ... perhaps there's a reason every other architecture's SMP
flush_tlb_mm() implementation is much more complicated than ours ...

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
