Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hawk.mail.pas.earthlink.net (hawk.mail.pas.earthlink.net [207.217.120.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B0F74829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 14:42:29 -0600 (MDT)
Message-ID: <3D92203F.3020801@earthlink.net>
Date: Wed, 25 Sep 2002 15:44:47 -0500
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
References: <3D8F01140000099E@ocpmta2.be.tiscali.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

jsoe0708@tiscali.be wrote:
> Hi Brian,
> 
> Sorry, the last test I do on my b180 and gpmdata as mouse driver does not
> work :)
> (xfree86-4.1)
> 
Forgot what mouse type you're supposed to tell X you have. Just tried it 
on my i386, and had a hung mouse real fast! I thought it was Imps/2, but 
obviously not...

You are right -- if you return to the console with control-alt-F[1-6], 
and then back again, the issue clears up. It's a well-known but 
irritating "solution"



-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
