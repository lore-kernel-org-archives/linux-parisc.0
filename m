From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Mon, 6 Dec 2004 09:07:32 -0700
Message-ID: <20041206160732.GA10915@colo.lackof.org>
References: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
	<20041205050917.GA8057@colo.lackof.org>
	<16818.39252.802512.48866@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: davidm@hpl.hp.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <16818.39252.802512.48866@napali.hpl.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 04, 2004 at 09:15:00PM -0800, David Mosberger wrote:
> If the time-stamps are correct, it shouldn't even try to rebuild the
> man files,

I suspect the "bk -r -co -q" puts a current timestamp on the files.

>  but you can work around the lack of latex2man with
> 
> 	$ make L2M=cp

yep - that works too.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
