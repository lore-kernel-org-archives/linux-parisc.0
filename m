Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail12.speakeasy.net [216.254.0.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 596E448AD
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 09:39:23 -0600 (MDT)
Received: from unknown (HELO speakeasy.net) (caslivkoff@[216.27.161.152])
          (envelope-sender <caslivkoff@speakeasy.net>)
          by mail12.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 6 Oct 2003 15:39:22 -0000
Date: Mon, 6 Oct 2003 11:39:21 -0400
Subject: Re: [parisc-linux] Xfree on a B180L
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Marc Dilasser <marc.dilasser@free.fr>
From: Chuck Slivkoff <caslivkoff@speakeasy.net>
In-Reply-To: <200310061723.40002.marc.dilasser@free.fr>
Message-Id: <418F7D30-F813-11D7-A0B2-000393581E44@speakeasy.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Monday, Oct 6, 2003, at 11:23 US/Eastern, Marc Dilasser wrote:

> HP B180L with a 21" Sun monitor, Debian 3.0 r1.
> Xfree runs but the colors are very yellow; harware problems or 
> something in
> the XFConfig-4 ?
>

Marc,

Here are a couple of possibilities that I can think of:

1/ The video timing is set to use sync-on-green (s-o-g). Does the 
monitor support it? What type of cable are you using? How does it 
connect to the monitor? Does it have HD-15 plug or 3/5-BNC connectors? 
Interrupt the boot and type "co mo" at the prompt. What timing is 
selected? If it does not list a "VESA" timing, then it is set to s-o-g. 
If you are using s-o-g and you have a 5-BNC cable, disconnect the H & V 
lines. Otherwise, try one of the VESA entries.

2/ You've selected to run in depth 8 TrueColor. If this is the case, 
then it will be normal due to the uneven distribution of RGB (332). 
Check the "xwininfo -root" output or look in XF86Config.

-chuck
