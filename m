Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (s217-115-138-231.colo.hosteurope.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0167F4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 01:23:09 -0600 (MDT)
From: "J.Steindlberger" <j@steindlberger.de>
To: Rod Smart <snaketails@optushome.com.au>
Subject: Re: [parisc-linux] Serial Terminal on C-180 system
Date: Tue, 17 Sep 2002 09:24:49 +0200
References: <3D86629A.F8CB5564@optushome.com.au>
In-Reply-To: <3D86629A.F8CB5564@optushome.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020917072310.0167F4829@dsl2.external.hp.com>
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

Hi Rod,

I guess Your problem is, that Your C180 graphic is not sending an usable 
signal to Your Monitor. You need to plug in keyboard an monitor. And a few 
seconds after switching on press the TAB key -- the workstation will change 
the video mode several times with about 3 seconds delay. Press ENTER if the 
mode is okay for You. (I hope it's correct in my mind)

I don't know whether or not You need do some changes via serial first. 
(Switch console with "pa con graphic(0)" perhaps)

On Tuesday 17 September 2002 01:00, you wrote:
>     Hello again.
>
>     Last time I was here I was asking about how to get the C-180 to use
> Serial Terminal, I havn't been able to get it talking to the other Linux
> or wincrash system, so I would like to transfer it back to Video mode
> (turn off Serial Terminal.
>
>     How do I do this when I cannot see the screen ?
