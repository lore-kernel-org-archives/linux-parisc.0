From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3000 HPMC with high NFS traffic. 99% it's ASTRO's
	fault?
Date: Fri, 20 Aug 2004 01:41:34 -0600
Message-ID: <20040820074134.GE29422@colo.lackof.org>
References: <20040813145557.GB31035@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040813145557.GB31035@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 13, 2004 at 10:55:58AM -0400, Carlos O'Donell wrote:
> High Priority Machine Check (HPMC): Code=1 regs=103b1080
> (Addr=00000000)

FYI, my c3600 at work also HPMC'd with tg3 stuff on the stack.
It crashed again while I was out of town and will see if it's
the same fingerprint. IIRC, this c3600 is running 2.6.4 kernel 
and was just recently started being use as system-imager server.
(in addition to the http/ftp services it advertises).

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
