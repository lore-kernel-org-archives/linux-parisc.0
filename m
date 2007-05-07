From: William Lee Irwin III <wli@holomorphy.com>
Subject: [parisc-linux] Re: [patch] removes MAX_ARG_PAGES
Date: Mon, 7 May 2007 12:01:07 -0700
Message-ID: <20070507190107.GF19966__40275.5080293447$1416624356$gmane$org@holomorphy.com>
References: <65dd6fd50705060151m78bb9b4fpcb941b16a8c4709e@mail.gmail.com>
	<617E1C2C70743745A92448908E030B2A01719390@scsmsx411.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-arch@vger.kernel.org,
 Andrew Morton <akpm@osdl.org>,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 linux-kernel@vger.kernel.org,
 Andi Kleen <ak@suse.de>,
 linux-mm@kvack.org,
 Ollie Wild <aaw@google.com>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: "Luck, Tony" <tony.luck@intel.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <617E1C2C70743745A92448908E030B2A01719390@scsmsx411.amr.corp.intel.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

At some point in the past, Ollie Wild wrote:
>> We've tested the following architectures: i386, x86_64, um/i386,
>> parisc, and frv.  These are representative of the various scenarios
>> which this patch addresses, but other architecture teams should try it
>> out to make sure there aren't any unexpected gotchas.

On Mon, May 07, 2007 at 10:46:49AM -0700, Luck, Tony wrote:
> Doesn't build on ia64: complaints from arch/ia64/ia32/binfmt_elf.c
> (which #includes ../../../fs/binfmt_elf.c) ...
[...]
> Turning off CONFIG_IA32-SUPPORT, the kernel built, but oops'd during boot.
> My serial connection to my test machine is currently broken, so I didn't
> get a capture of the stack trace, sorry.

It needs to sweep 32-bit emulation code more generally.


-- wli
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
