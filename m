Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 12 Jan 2003 19:13:06 -0700
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.56-pa0 64bit successful boot
Message-ID: <20030113021306.GB30895@dsl2.external.hp.com>
References: <20030112021041.32cfbb84.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030112021041.32cfbb84.varenet@esiee.fr>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sun, Jan 12, 2003 at 02:10:41AM +0100, Thibaut VARENE wrote:
> FWIW, SMP kernel with the exact same configuration died just at:
> POSIX conformance testing by UNIFIX

I looked at the dmesg you had attached. Please don't compress
them in the future - defeats archive searches later.

The dmesg output reminded me the init sequence has substantially changed.
I'd be very susicious that additional CPUs are brought "online" later than
before.  I would guess that arch/parisc/kernel/smp.c and processor.c
needs to be changed to match. Can you retry CONFIG_SMP with
EARLY_BOOTUP_DEBUG enabled in arch/parisc/kernel/pdc_cons.c?

Oh, and also set kDEBUG in arch/parisc/kernel/smp.c to 100.

thanks,
grant
