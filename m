Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Jun 2003 10:50:53 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Mark Mestdagh <Mark.Mestdagh@Icon-Europe.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600
Message-ID: <20030630165053.GF14971@dsl2.external.hp.com>
References: <1056953609.3effd509f3f5f@wiebel.dommel.com> <20030630063026.GC4714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030630063026.GC4714@tausq.org>
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

On Sun, Jun 29, 2003 at 11:30:26PM -0700, Randolph Chung wrote:
> Why can't you use the prebuilt kernels? kernel-image-2.4.20-32-smp
> supports SMP (and the corresponding 64-bit version too...)

just a reminder...64-bit SMP is not stable yet.
32-bit SMP seems to work fine.

And I park a few "custom" kernels on ftp.parisc-linux.org/kernels/
which include the .config files used to build the kernels.
You want to look at c3000 kernels.

grant
