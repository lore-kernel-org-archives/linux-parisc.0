From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3
Date: Tue, 29 May 2007 12:10:17 -0400
Message-ID: <20070529161017.GE10560__3758.09853799201$1416624377$gmane$org@fattire.cabal.ca>
References: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 29, 2007 at 05:34:50PM +0200, Joel Soete wrote:
> I just noticed the same pb you mentioned but with 2.6.22-rc2 rebuild with
> gcc-4.1.3 20070518 (debian pkg) ro run 32bit up kernel only:
> patst004 login: Backtrace:

So on 32-bit it actually makes it to userspace? Interesting.

I've spent the last 2 days debugging this, I'll let you know when I have
something to test.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
