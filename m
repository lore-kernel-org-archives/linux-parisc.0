From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Tue, 19 Jul 2005 21:04:25 -0400
Message-ID: <20050720010425.GC24060@roadwarrior.mcmartin.ca>
References: <42DD6A7F.8090706@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42DD6A7F.8090706@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 19, 2005 at 03:02:55PM -0600, Kurt Fitzner wrote:
> I'm using a 3c905 PCI ethernet card rather than the stock 10 megabit
> LASI on board.
> 
> I'm wondering if this might be an issue with the ethernet driver when
> compiled for PARISC.  I've tried very large ftp transfers and can't
> reproduce the problem that way.

TOC dump, IIR, IOAQ/IASQ locations? Come on people... It's really hard
to even begin to figure out what's wrong if no debugging information
has been provided...

http://www.parisc-linux.org/faq/kernelbug-howto.html

-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
