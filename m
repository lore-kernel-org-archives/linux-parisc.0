Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from punt.aladdin.de (punt-2.aladdin.de [212.14.90.2])
	by dsl2.external.hp.com (Postfix) with SMTP id 3F2E1482A
	for <parisc-linux@parisc-linux.org>; Wed, 26 Mar 2003 10:20:31 -0700 (MST)
Date: Wed, 26 Mar 2003 18:20:10 +0100
Message-Id: <200303261720.SAA04409@panther.aladdin.de>
To: n0ano@n0ano.com
Cc: adriano@satec.es, davidm@hpl.hp.com, linux-ia64@linuxia64.org,
	markus.schaber@student.uni-ulm.de, m.delahaye@esiee.fr,
	parisc-linux@parisc-linux.org, willy@debian.org
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
From: Christian Groessler <cpg@aladdin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,

On 03/26/2003 09:25:35 AM MST n0ano wrote:
>
>Well, Itanium's can sort of run any X86 software.
>
>As David was alluding to there are two ways you can boot an Itanium
>box, either with an IA32 kernel (a current Pentium based OS) or an
>IA64 kernel.
>
>If you boot an IA32 kernel the CPU will behave as an exact Pentium
>processor and execute all Pentium code.  The system will be slower
>than comparable Pentium processors but it should work exactly the
>same.  (Notice that I say `should', I've never done this, there could
>be chipset issues, I don't know of anyone who has done this but it
>should work.)

Does the ia32 emulation go that far to also emulate 16bit operation,
iow, could one boot DOS?

regards,
chris
