Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms-0.9.1 && hppa (follow ...) 
In-Reply-To: Message from "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
   of "Thu, 07 Mar 2002 15:32:31 +0100." <OF0AD397FF.17ED40BE-ONC1256B75.004D4BB9@com>
References: <OF0AD397FF.17ED40BE-ONC1256B75.004D4BB9@com> 
Date: Thu, 07 Mar 2002 10:06:35 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020307170635.4D95C4872@dsl2.external.hp.com>
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

"=?iso-8859-1?Q?Jo=EBl_Soete?=" wrote:
...
> I am not quiet sure to be absolutely right but for a first test, I only
> change "user_parms->buffer_address" by "tmp.buffer_address"
> and the system does not anymore crashes:

Excellent. That was too easy.

...
> As you can see it is not yes perfect because: "evms_vgscan(267): unaligned
> access to 0x00022efe at ip=3D0x40207d8f"

The kernel should be dealing with unaligned access - the msg is a
warning since it will have substantial performance impact.

> and also logs a lot of data page fault:

Yeah - gdb to debug those.

...
> Humm ... have you an idea why this problem did not appears for this i386 or
> ppc (the two official supported till now)?

Dunno. Luck?
Those arches may not be as sensitive to address space issues.

welcome,
grant
