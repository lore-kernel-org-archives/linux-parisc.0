Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 24 Oct 2002 08:18:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20021024071800.GG603@sleepie.demon.co.uk>
References: <20021023164611.60FD7482F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021023164611.60FD7482F@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 varenet
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

On Wed, Oct 23, 2002 at 10:46:11AM -0600, Thibaut Varene wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.5
> Changes by:	varenet	02/10/23 10:46:11
> 
> Modified files:
> 	include/asm-parisc: param.h 
> 
> Log message:
> Switched to HZ == 1000 for CONFIG_PA20.
> Patch submitted by Laurent Canet.

Don't know if this was simply a #define change, but if so...
Robert Love has been arguing lately that you can't just do that as
various userspace stuff is compiled with a knowledge of the kernel HZ
value for your specific arch and uses that in interpreting various
entries in /proc.  He had a patch that kept the userspace view
consistent.  That was 2.4 though; maybe 2.5 is better in this respect.

Richard
