From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] readb/__raw_readb/gsc_readb and ioremap
Date: Sat, 30 Oct 2004 22:37:16 -0600
Message-ID: <20041031043716.GD5050@colo.lackof.org>
References: <20041031033950.GN8958@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041031033950.GN8958@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 31, 2004 at 03:39:50AM +0000, Matthew Wilcox wrote:
> __raw_read/writeX:
>  - Don't byteswap
>  - Should be used on ioremap'ed address
> read/writeX:
>  - Byteswap
>  - Should be used on ioremap'ed address

Willy confirmed there is another subtle difference between the
two sets of functions:
	__raw_read/writeX relax PCI ordering requirements.
	read/writeX enforce PCI Ordering requirements.

Willy correctly ignored this topic since parisc machines are strongly
ordered for IO as well (so far at least).
But I didn't want folks to think byte swapping was the only difference.

Be VERY careful of using __raw_XXX forms outside of parisc specific code.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
