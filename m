Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id F14BA488A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 10:50:44 -0700 (MST)
Date: Fri, 6 Feb 2004 10:50:38 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb
Message-ID: <20040206175038.GC20990@colo.lackof.org>
References: <40218AE200000F67@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40218AE200000F67@ocpmta2.freegates.net>
Cc: Randolph Chung <randolph@tausq.org>, bame@hp.com,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 06, 2004 at 08:31:47AM +0100, Joel Soete wrote:
> -----------------  Processor 0 HPMC Information ------------------
> 
> Timestamp = 
>   Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)
> 
> HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc  
> 
> General Registers 0 - 31
> 00-03   0000000000000000  000000001043e000  00000000000600d0  fffffff0f0000018

What does 00000000000600d0 point at?
Is that the boot loader?

> IIA Space                    = 0x0000000000000000
> IIA Offset                   = 0x00000000001000e4

Is the CPU still in real mode?
ie haven't switched to virtual mode yet?

> Check Type                   = 0x20000000
> CPU State                    = 0x9e000004
> Cache Check                  = 0x00000000
> TLB Check                    = 0x00000000
> Bus Check                    = 0x003010bb
> Assists Check                = 0x00000000
> Assist State                 = 0x00000000
> Path Info                    = 0x00031800
> System Responder Address     = 0xfffffffffed10200
> System Requestor Address     = 0xfffffffffffa0000

CPU is trying to get data from 0xfed10200
What lives there?

> A Data Miss Timeout occurred while CPU 0 was
> requesting information.

Some device wasn't responding.

> General Registers 0 - 31
> 00-03   0000000000000000  fffffff0f009d000  000000f0f000b618  00000000000f4240

looks like the box HPMC'd, and then TOC to recover.
I think GR02 is a firmware address.
...
> IIA Space                    = 0x00000000000000f0
> IIA Offset                   = 0x000000f0f000b620
> CPU State                    = 0x9e000001


> I/O Module Error Log Information:
> 
> Timestamp = 
>   Fri Feb  6 07:20:26 GMT 2004    (20:04:02:06:07:20:26)
> 
> 
> '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> 
>  Rope     Word1        Word2            Word3
> ------ ------------ ------------
>    0    0x00000000   0x0e0cc009   0x00000000fed30048
>    1    0x00000000   0x1e0cc009   0x00000000fed32048

Note this is NOT the same address range that the CPU was
trying to talk to. And it looks like all the ropes are happy.
("cc" is the status or error word, IIRC)

If i had to guess, I would think Joel's box has a HW problem.
But I really don't know what's going on.

hth,
grant
