From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] A couple of minor patches for 2.6.7-pa1
Date: Fri, 18 Jun 2004 19:11:11 -0600
Message-ID: <20040619011111.GA23535@colo.lackof.org>
References: <40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
	<35844.127.0.0.1.1087594933.squirrel@www.puszczka.com>
	<20040618212600.GB12572@engsoc.org>
	<35884.127.0.0.1.1087595933.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Andy Walker <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <35884.127.0.0.1.1087595933.squirrel@www.puszczka.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 18, 2004 at 11:58:53PM +0200, Andy Walker wrote:
> Errm, no thank you - unless there are very good reasons why I need a
> new GCC.

If you want 7300LC scheduling support?
There's a whole raft of bug fixes betweem gcc 3.0.4 and gcc 3.3.3.
But I can understand the reluctance to upgrade.

> The automated builds on http://cvs.parisc-linux.org/download/linux-2.6

These are developement kernels. Treat them like "unstable".

> are broken for the B180 config because of this change which sends out
> the message that current versions are broken on 7300LC. Bad message!
> And I don't think we should be forcing GCC upgrades on people like this.

This is not forcing anyone to upgrade unless they want to use
*exactly* that config file. It's not reasonable to build "unstable"
kernel debs from "stable" tool chain.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
