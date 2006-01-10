From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: [Update] TLS toolchain.
Date: Tue, 10 Jan 2006 15:33:11 +0800
Message-ID: <43C36337.9040202@tausq.org>
References: <20060108055109.GE17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060108055109.GE17559@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The elf related failures are relatively new and related to binutils.
> ---
> 
> I'm going to run the NPTL build and see how the tests turn out.
> 
> Anyone remember what the next step was?

I think the gcc stuff is all merged upstream already.

binutils stuff needs to be merged upstream. Perhaps we should look at
those elf related failures first.

I don't think we are ready for NPTL yet. Did we settle on how we are
implementing futexes? Are we going to implement a new kernel fsyscall
for the compare-and-exchange primitive that NPTL seems to depend on?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
