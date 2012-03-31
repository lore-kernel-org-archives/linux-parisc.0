From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH RFC] Simplify the Linux kernel by reducing its state space
Date: Sat, 31 Mar 2012 13:25:02 -0700
Message-ID: <4F77681E.5010608@xenotime.net>
References: <20120331163321.GA15809@linux.vnet.ibm.com> <20120331201500.GA27640@linas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org,
	linux-mips@linux-mips.org, linux-am33-list@redhat.com,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, tglx@linutronix.de,
	linux@arm.linux.org.uk, dhowells@redhat.com, jejb@parisc-linux.org,
	linux390@de.ibm.com, x86@kernel.org, cmetcalf@tilera.com
To: Linas Vepstas <linasvepstas@gmail.com>
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20120331201500.GA27640@linas.org>
List-ID: <sparclinux.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03/31/2012 01:15 PM, Linas Vepstas wrote:

> 
> Hi,
> 
> I didn't actually try to compile the patch below; it didn't look like
> C code so I wasn't sure what compiler to run it through.  I guess maybe
> its python?  However, I'm very sure that the patches are completely
> correct, because I read them, and I also know Paul.  And I've heard of
> Thomas Gleixner.


x86_64 defconfig has many build errors and warnings.  :(

back to my abacus.

-- 
~Randy
