Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 295AD4852
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 10:10:06 -0600 (MDT)
Date: Tue, 3 Sep 2002 09:13:26 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
Message-ID: <20020903161326.GI14634@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020903070555.GR25710@tausq.org> <3D3815BD0000B0C0@ocpmta5.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815BD0000B0C0@ocpmta5.be.tiscali.com>
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

> General Registers 0 - 31
> 00-03   0000000000000000  00000000103b7244  0000000010108064  00000000207f8000
                                              ^^^^^^^^^^^^^^^^ GR02, aka
                                              the return pointer

> Control Registers 0 - 31
> 00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11   0000000000000634  0000000000000000  00000000000000c0  0000000000000017
> 12-15   0000000000000000  0000000000000000  0000000000107000  0000000000000000
> 16-19   0000007be95ffc60  0000000000000000  0000000010108638  000000000fa11288
                                                                ^^^^^^^^^^^^^^^^
cr19 is the "IIR", this is the insn that caused the fault
in this case, this insn is stw r1,4(sr0,r29)


> 20-23   0000000010240224  0000000048030104  000000000004000e  0000000080000000
> 24-27   0000000000305000  0000000000305000  0000000000044021  00000000f0412000
> 28-31   0000000055555555  0000000055555555  000000001f1f8000  00000000103a8000
                            ^^^^^^^^^^^^^^^^ which looks quite bogus

> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x000000001010863c
this is the "iaoq" -- the instruction pointer

> But where is iaoq (I do not found in linux/Documentation/parisc)?
> 
> here is what I got: grep 101080 /boot/System.map-2.4.19-pa9
> 10108000 T syscall_exit_rfi
> 10108064 t intr_return
> 10108078 t intr_check_resched
> 10108084 t intr_check_sig
> 10108090 t intr_restore

is this the system.map from the kernel you are building?
if it is, then intr_return is the calling function (one up in the
stack). the function that includes 1010863c is the one that one that's
causing the fault. that would be one place to look.

hth
randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
