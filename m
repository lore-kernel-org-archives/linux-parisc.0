Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2993C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Mar 2002 22:44:14 -0700 (MST)
Message-ID: <3CA2ADDB.4EE8AFA4@cisco.com>
Date: Wed, 27 Mar 2002 21:44:59 -0800
From: Christian Suder <csuder@cisco.com>
MIME-Version: 1.0
To: David Dougall <davidd@et.byu.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mozilla, etc.
References: <Pine.LNX.4.33.0203272123310.1463-100000@lewis.et.byu.edu>
Content-Type: text/plain; charset=us-ascii
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

David,

since rcently you can get the mozilla package with a simple "apt-get install
mozilla", so there is no need to go through the excercise of compiling it
yourself (and it takes several hours on older HW - been there). However it
still doesn't run, as far as I know because the threads are still far from
perfect in palinux. There's a couple of other applications suffering from
this too.

For now I use "dillo" on the parisc machines.

    Christian


David Dougall wrote:

> I am quite please with my B132 running 0.9.3.  I am having a slight
> difficulty.  How do I get a web browser?  I was going to try to get
> mozilla compiled, but it was complaining that I don't have "zip"
> installed.  First of all, where is "zip"?  What package is it in?  I tried
> apt-get install zip and it returned an error.  Has anyone else gotten
> mozilla to work on parisc-linux?  Is there another browser that would be
> better?  If so, please advise(or a binary download wouldn't hurt).
> Thanks
> --David Dougall
>
> PS: is there any hope of a jre on parisc-linux?
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
