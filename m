From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] pci.h pb with gcc-4.0
Date: Thu, 19 Jan 2006 11:28:21 -0700
Message-ID: <20060119182821.GC2628@colo.lackof.org>
References: <ITCBDZ$237BDD3D61015C37DE6E824ACAF3708B@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ITCBDZ$237BDD3D61015C37DE6E824ACAF3708B@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 19, 2006 at 01:44:23PM +0100, Joel Soete wrote:
> hello *,
> 
> mmm don't know if because I use gcc 4.0 but here is a pb I encounter to build
> 2.6.16-rc1-pa1 (+patch):
...
> /CAD/linux-2.6.16-rc1-pa1/arch/parisc/kernel/pci.c:56: error: static
> declaration of \xe2\x80\x98pci_hba_count\xe2\x80\x99 follows no
> n-static declaration
> include2/asm/pci.h:206: error: previous declaration of
> \xe2\x80\x98pci_hba_count\xe2\x80\x99 was here

We can also remove the extern declaration of parisc_pci_hbap[].
I'll fix this by this weekend.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
