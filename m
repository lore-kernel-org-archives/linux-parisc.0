Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F268482C
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 21:34:40 -0700 (MST)
Message-Id: <200112120429.VAA03750@puffin.external.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 kernel and CVS -- opinions? 
In-Reply-To: Message from Paul Bame <bame@fc.hp.com>
   of "Tue, 11 Dec 2001 09:44:56 MST." <E16Dq1Y-0002zm-00@noam.fc.hp.com>
Date: Tue, 11 Dec 2001 21:29:25 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Paul Bame wrote:
> It's time to start tracking the 2.5 kernel at cvs.parisc-linux.org
> and there are a few different ways to do it -- I'm looking for opinions.
> My favorite option at the moment is 1A.

I'm ok with 1A as well:
o *someday*, I hope the CVS date-based check out will get fixed.
o TAGs work and I'm ok with tag being used.
o We could TAG weekly (or monthly) and keep enough nightly
  checkout's to cover two or three tags. Or whatever we can
  afford for diskspace.


thanks!
grant
