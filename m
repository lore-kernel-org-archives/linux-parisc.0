From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Tue, 25 Jul 2006 16:02:35 -0600
Message-ID: <20060725220235.GB28294@colo.lackof.org>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
	<7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
	<1153750204.1235.18.camel@mulgrave.il.steeleye.com>
	<20060724163228.GA22560@colo.lackof.org>
	<1153839113.3452.28.camel@mulgrave.il.steeleye.com>
	<20060725161345.GA13707@hiauly1.hia.nrc.ca>
	<1153844239.3452.29.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Matthew Wilcox <matthew@wil.cx>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153844239.3452.29.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 25, 2006 at 11:17:19AM -0500, James Bottomley wrote:
> On Tue, 2006-07-25 at 12:13 -0400, John David Anglin wrote:
> > How about disabling L2?  This should test your theory.
> 
> Kyle's working on it based on Grant's original work ... you need access
> to a lot of secret diag registers to do this, though, so it's not easy.

You misheard. I'll be poking at this again in the near future.
I've gotten the code to modify diag registers done.
I just need to test the L2 disable and write a wrapper that
does the necessary I/D cache flushing.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
