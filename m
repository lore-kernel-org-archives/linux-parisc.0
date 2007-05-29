From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Re: PATCH remove remnants of softirq
Date: Tue, 29 May 2007 10:05:06 -0400
Message-ID: <20070529140506.GC10560__42486.4174951383$1416624377$gmane$org@fattire.cabal.ca>
References: <20070528223159.GC16928@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070528223159.GC16928@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 28, 2007 at 04:31:59PM -0600, Grant Grundler wrote:
> Kyle,
> 
> This patch removes remnants of softirq support that we no longer need.
> I suspect this was just overlooked when willy convert parisc to generic
> IRQ support.
> 
> Tested on c3600 32-bit UP.
> 

ACK once it's been tested a bit more thoroughly.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
