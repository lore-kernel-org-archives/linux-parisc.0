From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Date: Mon, 24 Mar 2003 12:50:32 +0000
Message-ID: <20030324125032.GK31008__14784.5946172767$1416622322$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk> <003901c2f200$2fb2e450$6620a4d5@tsatec.int>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 'Matthew Wilcox' <willy@debian.org>, linux-ia64@linuxia64.org,
	parisc-linux@parisc-linux.org
To: Adriano Galano <adriano@satec.es>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <003901c2f200$2fb2e450$6620a4d5@tsatec.int>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Mar 24, 2003 at 01:23:32PM +0100, Adriano Galano wrote:
> If IPF support PA-RISC mapping is not easy to "port" the PA/RISC Linux,
> excluding architectural changes in the chipset or booting process?

Why would you want to?  ia64 already has its own perfectly good Linux port.

> How HP/UX v 11.6 could be offer compatibility between PA/RISC and Itanium 2
> systems?

That's `11i v1.6'.  Quoting from
http://www.hp.com/products1/unix/operating/choice/hp-ux11i_details.html

	PA-RISC binary compatibility

  HP-UX 11i version 1.6 includes the Aries dynamic code translation
  technology as an integrated component. Aries is built on the close
  relationship between the PA-RISC and Intel Itanium instruction sets
  and provides binary compatibility for PA-RISC binaries on the Itanium
  processor family. Aries can be used where performance is not critical
  or where it is not possible to create a native Itanium processor
  family binary.

> How "exact" is the PA-RISC mapping on the IA-64 core?

Not particularly close.  If you look at the assembly language level,
there's a lot of similarities, but there's a lot of differences too.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
