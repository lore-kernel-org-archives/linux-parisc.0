Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F128482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 00:44:43 -0700 (MST)
Message-Id: <200111130740.AAA26126@puffin.external.hp.com>
To: "Craig D. Lansing" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost There... 
In-Reply-To: Message from "Craig D. Lansing" <lansing@beldar.com>
   of "Mon, 12 Nov 2001 19:07:35 EST." <004401c16bd7$33ae82e0$0101a8c0@pogo>
Date: Tue, 13 Nov 2001 00:40:03 -0700
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

"Craig D. Lansing" wrote:
...
> In the meantime, how do I change the "Command Line" at boot?
> Do I have to "interact" with IPL (almost as bad as having to interact with
> people :-) ?

Yes. Adding new params is less obvious: edit any param and append ' '
plus the new param.

grant
