Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 302DC4842
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 10:48:04 -0700 (MST)
Received: from cs.ucc.ie (sal.ucc.ie [143.239.201.201])
	by interzone.ucc.ie (8.9.3/8.9.3) with ESMTP id RAA03796
	for <parisc-linux@lists.parisc-linux.org>; Mon, 4 Feb 2002 17:49:11 GMT
Message-ID: <3C5EC909.40703@cs.ucc.ie>
Date: Mon, 04 Feb 2002 17:46:49 +0000
From: "M. Grabert" <xam@cs.ucc.ie>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] how to set up an apt-proxy for debian hppa ?
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

Hi all,

I want to keep my C240 uptodate,
but unfortunately I don't have a Internet connection at home.
(This would cost me a fortune and here in Ireland you can't
get much more than 56.6k anyway)

However, I have a Internet connection (100Mbit) at work
(university) and I have a laptop at work that I can use at home.

I don't think that I'd be allowed to take my C240 to the university
in order to do an apt-get update && apt-get upgrade; moreover it's
damn heavy ;-)
Therefore I want to fetch the latest hppa-packages and save them
on my laptop and use the laptop as a kind of apt-proxy.

I don't have any clue how the debian package management works,
but is all I need to do mirror the URLs listed in the
/etc/apt/sources.list (at least the hppa-specific directories),
e.g. by using wget ?

Since there is Win2k preinstalled on the laptop I have to
use a solution that runs on Windows!
(at least my PC at work is 100% MS free ;)
Is there a mini-howto or software available that solves my problem
(except http://sourceforge.net/projects/apt-proxy/) ?

Any hints ?

greetings max
