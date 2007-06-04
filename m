From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PARISC] Fix kernel panic in check_ivt
Date: Mon, 4 Jun 2007 06:05:44 -0600
Message-ID: <20070604120544.GA23968__47870.7346752801$1416624388$gmane$org@parisc-linux.org>
References: <20070604054954.GA12289@fattire.cabal.ca>
	<20070604062315.GA12848@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070604062315.GA12848@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 04, 2007 at 02:23:15AM -0400, Kyle McMartin wrote:
> @@ -802,13 +802,14 @@ void handle_interruption(int code, struct pt_regs *regs)
>  
>  int __init check_ivt(void *iva)
>  {
> +	extern const u32 os_hpmc[];
> +	extern const u32 os_hpmc_end[];

Cute.  If it works, it's cleaner code, so by all means.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
