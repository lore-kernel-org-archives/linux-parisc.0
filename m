From: Anders <dizzey@ing.umu.se>
Subject: Re: [parisc-linux] k-class smp_call_function
	at	arch/parisc/kernel/smp.c:340
Date: Mon, 28 Mar 2005 15:38:37 +0200
Message-ID: <20050328133837.GA14623@ing.umu.se>
References: <20050328122749.GB12853@ing.umu.se> <424800DB.6000709@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <424800DB.6000709@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 28, 2005 at 01:04:27PM +0000, Joel Soete wrote:
> 
> 
> Anders wrote:
> >well i got help with the ccio-dma problem.
> >but now i get smp badness.
> >
> mostly harmless (see among other reports: 
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024291.html>
> 
> >kernel 2.6.12-rc1-pa4 with a little ccio fix 
> Cool
> 
> >gcc version 3.3.5
> >
> >bootlog can be found at 
> >www.ing.umu.se/~dizzey/k460_bootlog
> >
> Do I well understand: the system hung after last messages:
> ...
> FLT  5208
> 
> 
> 
> FLT"
> 
> ?
> 
> (sorry never seen this before?)
> 
> btw could you have a try with a up kernel?
> 
> Thanks,
> 	Joel
> 
Well yes the system hung after those messages the FLT parts are from the 
firmware during the reboot, so i only included them to show it was 
rebooting.  i will be back with a test from a up kernel soon.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
