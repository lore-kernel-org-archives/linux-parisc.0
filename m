From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] TLS added relocations.
Date: Sun, 10 Apr 2005 03:48:04 -0700
Message-ID: <20050410104804.GL6987@tausq.org>
References: <20050405161549.GM1833@baldric.uwo.ca>
	<20050405162643.GB6987@tausq.org>
	<20050405163400.GN1833@baldric.uwo.ca>
	<20050405191612.GQ1833@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405191612.GQ1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> If it can compile this then it's cool. Normal gcc/binutils chokes but
> the tls-toolchain works just fine :)
> 
> Please update your documentation, the symbols used for relocation don't
> match (e.g. $tls_dtlndx$ is really $tls_gdix$)?

Which documentation are you using? Please work off of
http://wiki.parisc-linux.org/ThreadLocalStorage
I've been keeping that up to date as I find bugs in the original design.

Once we get it sorted out we can go back to fix the PDF.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
