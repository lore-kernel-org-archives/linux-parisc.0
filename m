From: Kyle McMartin <kyle@engsoc.org>
Subject: Re: [parisc-linux] Booting 712/80 without keyboard
Date: Wed, 7 Jul 2004 09:17:43 -0400
Message-ID: <20040707131743.GK16374@engsoc.org>
References: <40EBF536.8030207@c-p-f.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: CrazyCat <crazycat@c-p-f.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40EBF536.8030207@c-p-f.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 07, 2004 at 03:05:58PM +0200, CrazyCat wrote:
> Does anyone already make something like this? I don't want to crash my
> engine...
> 
> And don't you know if this kind of dongle are selled somewhere (I prefer
> when it's manufacturer than myself) ?
> 

You don't... actually... need to have something like this. 712 does let
you boot without keyboard, but it's not straight forward, and there's a
chance that if you bugger up the command, you will not be able to fix
it.

It involves booting into the HP-UX ISL, and changing the console path to
serial. If you no longer have an HP-UX ISL, you can find one here
http://cvs.parisc-linux.org/download/checkedout/build-tools/uxbootlf.

Directions can be found by googling for "hp 712 serial console" but
since there's a chance you'll fry your machine, I'll let you do that and
absolve myself of responsibility.

Regards,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
