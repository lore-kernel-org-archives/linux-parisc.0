From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 19:33:49 -0500 (EST)
Message-ID: <200702260033.l1Q0Xn44025896__44467.4892969944$1416624316$gmane$org@hiauly1.hia.nrc.ca>
References: <1172428258.3423.22.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172428258.3423.22.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 25, 2007 12:30:58 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Here's take II.  It corrects the problem with the prior one not being
> agressive enough .. plus sr3 is the wrong register to alter from
> userspace ... we really need to do sr4-7.

This one is less stable your previous change + reversion of tausq's
SMP TLB opimization patch.  GCC build doesn't get far before wierdness
occurs (strange characters being read from files):

gcc -c -g -fkeep-inline-functions      -gnatpg -gnata -I- -I. -Iada -I../../gcc/
gcc/ada ../../gcc/gcc/ada/exp_ch6.adb -o ada/exp_ch6.o
/tmp/ccaWBgD1.s: Assembler messages:
/tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
/tmp/ccaWBgD1.s:2436: Error: Field out of range [0..31] (-1).
/tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
/tmp/ccaWBgD1.s:2436: Error: Undefined register: '%s'.
/tmp/ccaWBgD1.s:2436: Error: Field out of range [0..31] (-1).
...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
