From: Alan Modra <amodra@bigpond.net.au>
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
Date: Mon, 24 Feb 2003 16:54:21 +1030
Message-ID: <20030224062421.GA31111__2212.37830487571$1416622234$gmane$org@bubble.sa.bigpond.net.au>
References: <20030223185847.C2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: binutils@sources.redhat.com, parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030223185847.C2938@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Feb 23, 2003 at 06:58:47PM +0000, Matthew Wilcox wrote:
> +	* hppa-dis.c: Do not emit a space register if the space register
> +	field is 2 bits and the value is 0 as this is implicit addressing,
> +	not use of space register 0.

Hi Matthew,
  ChangeLog entries shouldn't be sent as diffs.  Write this one as

	* hppa-dis.c (print_insn_hppa <2 bit space register>): Do not print
	the space register when the value is zero.

and put the reason for the change as a comment in the code if you feel
you need some justification for the change.

Did you run the binutils testsuite?

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
