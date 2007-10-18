From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Fix /proc/iomem
Date: Thu, 18 Oct 2007 16:10:55 -0600
Message-ID: <20071018221055.GC20102__22769.2284192473$1416624646$gmane$org@colo.lackof.org>
References: <20071014144826.GF29934@parisc-linux.org>
	<20071018213148.GA20102@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071018213148.GA20102@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 18, 2007 at 03:31:48PM -0600, Grant Grundler wrote:
> Why would ROM_ENABLE be set for something that's not a ROM?
> I would expect "is ROM BAR _and_ ROM_ENABLE".
> 
> What am I missing? Maybe add a comment for this?

Nevermind...this got explained over IRC.
ROM_ENABLE only gets checked for ROM devices.
Willy suggested this comment:
/* Don't register resources for disabled ROMs as they may overlap each other */

and that works for me.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
