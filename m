From: kyle@mcmartin.ca (Kyle McMartin)
Subject: Re: [parisc-linux] memory barriers, spinlocks, debuglocks, oh my
Date: Sun, 29 Aug 2004 12:13:18 -0400
Message-ID: <20040829161318.GU2414@mcmartin.ca>
References: <20040827163701.GA2414@mcmartin.ca>
	<20040828221524.GT2414@mcmartin.ca> <4132001E.6060707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4132001E.6060707@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 29, 2004 at 04:11:10PM +0000, Joel Soete wrote:
> Sorry, but here I am confused: for parisc-linux unlock means (x)->lock = 1?
> 
Yes, because the only atomic instruction we have is load and clear.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
