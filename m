From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3600 crash with PCMCIA bridge
Date: Sun, 8 Oct 2006 22:54:32 -0600
Message-ID: <20061009045432.GC30517@colo.lackof.org>
References: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 07, 2006 at 04:55:19PM +0200, Guy Martin wrote:
> I've been experiencing kernel crashes when I plug a RICOH RL5c475
> cardbus bridge.
> 
> I've attached the crash info.

Thanks - I've looked over lba_driver_probe() and I'm wondering why
we are getting a NULL pointer back from pci_scan_bus_parented().

If you could determine why pci_create_bus() is returning a NULL
pointer to pci_scan_bus_parented(), that would probably provide
clues to the real problem.

And the first "if (lba_bus)" right after that bus scan seems
wrong to me too since the code below it will crash anyway.
Seems a NULL lba_bus should cleanup and exit with an error.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
