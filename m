From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
	tst-fork1.
Date: Fri, 23 Feb 2007 15:23:29 -0600
Message-ID: <1172265809.3424.75.camel__42411.8842500777$1416624310$gmane$org@mulgrave.il.steeleye.com>
References: <119aab440702201034i501f5986l3381456035de0699@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702201034i501f5986l3381456035de0699@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2007-02-20 at 13:34 -0500, Carlos O'Donell wrote:
> sr00-03  00000000000e2800 00000000000e2800 0000000000000000 00000000000e2800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040334894 0000000040334898
>  IIR: 0ec25033    ISR: 00000000000e2800  IOR: 00000000000aac8c
                         ^^^^^^^^^^^^^^^^
This clearly identifies the faulting space

>  CPU:        0   CR30: 000000009ad38000 CR31: 0000000040848000
>  ORIG_R28: 00000000407f6c00
>  IAOQ[0]: pa_memcpy+0x114/0x2d0
>  IAOQ[1]: pa_memcpy+0x118/0x2d0
>  RP(r2): copy_from_user+0x34/0x40
> Backtrace:

Which means that somehow a TLB entry got inserted for address
00000000000aac8c in space 00000000000e2800 which didn't have the correct
Access ID (which for us should have been the space 00000000000e2800).

Or, that %cr8 somehow doesn't contain the space 00000000000e2800 ... but
I think that's a bit more unlikely.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
