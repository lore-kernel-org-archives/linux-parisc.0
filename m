From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LCD heartbeat
Date: Mon, 21 Mar 2005 11:42:25 -0700
Message-ID: <20050321184225.GB22532@colo.lackof.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<20050320210357.53534d01@Tatooine.r3z0>
	<200503202257.31924.dmp@davidmpye.dyndns.org>
	<200503202317.05481.dmp@davidmpye.dyndns.org>
	<20050321045506.GA18458@ntlworld.com>
	<20050321071945.GA10108@colo.lackof.org>
	<20050321134326.GA19102@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050321134326.GA19102@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 21, 2005 at 01:43:26PM +0000, Stuart Brady wrote:
> On Mon, Mar 21, 2005 at 12:19:45AM -0700, Grant Grundler wrote:
> > 
> > Hrm...for LCD, can we program all 4 independently?
> 
> Surely not -- they share the same command/data registers, so the command
> byte for one register could be written, with the data for another one.

*nod*
I totatlly overlooked the fact that the target of the writes was
one register pair:
	LCD display at f05d0008,f05d0000 registered


> If this isn't happening, that must be because only one LED is beingk
> updated at a time, but I don't think we should rely on that.

yeah. original scheme is on the right track.
I was not happy with the implementation but I think the
next version will address those (dealt with them offlist).

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
