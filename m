From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 18:38:57 -0600
Message-ID: <20060425003857.GA30653@colo.lackof.org>
References: <20060424162545.GA25893@colo.lackof.org>
	<200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Apr 24, 2006 at 12:50:48PM -0400, John David Anglin wrote:
> > AFAIK, only one non-coherent PA-RISC box has PA2.0 and parisc-linux
> > doesn't support it: T600.
> 
> It probably has coherent I & D caches as well as this seems to be a
> requirement for both 1.1 and 2.0.

Sorry - you are correct.
I was thinking IO. T600 is not DMA/cache coherent.

apologies for spacing out,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
