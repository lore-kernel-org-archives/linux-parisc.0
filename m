From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] [patch] Disable parport autoprobing on !X86
Date: Thu, 14 Jun 2007 16:28:12 +0100
Message-ID: <20070614162812.5c0eea6b__3015.16310214556$1416624393$gmane$org@the-village.bc.nu>
References: <46715250.4050101@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: linux-parport@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46715250.4050101@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 14 Jun 2007 22:36:00 +0800
Randolph Chung <randolph@tausq.org> wrote:

> The attached patch disables auto-probing on non-X86 platforms. On many 
> other platforms, autoprobing causes a machine check.
> 
> Thanks to Julian Stecklina for reporting and helping to debug the problem.
> 
> thoughts/comments?

If io[0] is set the caller has specified a port to probe which seems like
it shouldn't be ignored ?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
