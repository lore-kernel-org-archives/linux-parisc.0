From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Easy Firmware Upgrade for C180
Date: Sun, 27 Mar 2005 19:39:03 -0700
Message-ID: <20050328023903.GF30963@colo.lackof.org>
References: <913ffb071295fac86a0aade164cf5a27@cox.net>
	<20050326221203.GC9287@colo.lackof.org>
	<7bf52f57850fdda76799870f47398756@cox.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Erik T.Crouch" <lennier@cox.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7bf52f57850fdda76799870f47398756@cox.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 27, 2005 at 12:36:32PM -0600, Erik T.Crouch wrote:
> Actually figured it out, you can dd it to a virtual disc, then make it 
> a bin image which you can translate into an ISO
> 
> It worked great that way, but a little annoying because you have to 
> work with dd to get it going.

cool. If you write up a nice recipe, I'll add it to our collection
of HOW-TO's and a reference from the FAQ.


> Anyway, I have 6.2 firmware on the beast now, but Debian still wont 
> boot, HPMC Code=1 is what I get.  I'm assuming it means I'll have to 
> serial console but I was  hoping to avoid that.
> 
> Any ideas on that?

No. I need console output. Disconnect the keyboard and capture output
from serial port 1. Post the output to the parisc-linux mailing list.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
