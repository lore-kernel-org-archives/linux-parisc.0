From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] TLS added relocations.
Date: Tue, 5 Apr 2005 15:39:59 -0400
Message-ID: <20050405193958.GR1833@baldric.uwo.ca>
References: <20050405161549.GM1833@baldric.uwo.ca>
	<20050405162643.GB6987@tausq.org>
	<20050405163400.GN1833@baldric.uwo.ca>
	<20050405191612.GQ1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405191612.GQ1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 05, 2005 at 03:16:12PM -0400, Carlos O'Donell wrote:
> On Tue, Apr 05, 2005 at 12:34:01PM -0400, Carlos O'Donell wrote:
> > I can't turn that machinery on yet. I have to test with TLS off but
> > handling the relocations first to see if it works :)
> 
> To hell with it, I'm turing it all one just to see what I need.
> One thing, I'm writing some configure.in asm to test gas and such.
> What do you think of this as a test:
> 
> gcc -c only.

This turns on HAVE_TLS_SUPPORT in glibc btw.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
