Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 25 Aug 2003 10:45:53 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030825164553.GB28778@dsl2.external.hp.com>
References: <3F2E2C7700004E38@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F2E2C7700004E38@ocpmta2.freegates.net>
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

On Mon, Aug 25, 2003 at 12:03:20PM +0200, Joel Soete wrote:
> So I would like to study now the early boot process
> (specialy for the second cpu) to try to understand how caches (for shared
> insn and data) are replicated into other CPU's [id]tlb.

The additional CPUs just reference (ie load) the shared data using
the same address. AFAIK, a cacheline will get loaded as "shared clean"
until someone writes to it - which is when the cacheline ping-pong
starts.

> Can you tell me more: in a previous piminfo collected I got for CPU#3 (3
> is the "address" of the second cpu)

PAT PDC (L-/N-class and A500) have hard coded numbers for CPUs.
parisc-linux only uses logical CPU numbers to avoid sparsely populated
arrays. parisc-linux can get the "Physical CPU #" from PAT PDC.
See code inside USE_PAT_CPUID in arch/parisc/kernel/processor.c.
You might hack that code a bit so you can correlate logic to physical
CPU numbers.

grant
