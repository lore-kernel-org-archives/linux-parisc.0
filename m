From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [PATCH] Compat signal fixes for 64-bit parisc.
Date: Mon, 12 Feb 2007 21:47:06 -0500
Message-ID: <20070213024706.GB30033__37597.2988120795$1416624289$gmane$org@athena.road.mcmartin.ca>
References: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 12, 2007 at 09:14:28PM -0500, Carlos O'Donell wrote:
> +			addr = (unsigned int)((u64)from->si_addr & 
> 0xffffffffUL);

I think this could be ptr_to_compat() here?

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
