Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 702DA4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 May 2003 23:26:00 -0600 (MDT)
Date: Wed, 28 May 2003 08:56:17 -0600
From: dann frazier <dannf@dannf.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs migration
Message-ID: <20030528145617.GA10081@dannf.org>
References: <20030528064250.GA29360@dannf.org> <3ED467BB.90204@bluehash.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3ED467BB.90204@bluehash.de>
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

On Wed, May 28, 2003 at 09:39:39AM +0200, Rüdiger Scholz wrote:
> Hello,
> 
> I just tried to do a "cvs update", but I get an error during anonymous 
> login:
> 
> ruediger@gandalf:/usr/src$ cvs login
> Logging in to :pserver:anonymous@cvs.parisc-linux.org:2401/var/cvs
> CVS password: [empty]
> cvs login: authorization failed: server cvs.parisc-linux.org rejected 
> access to /var/cvs for user anonymous
> ruediger@gandalf:/usr/src$
> 
> DNS-Entry of cvs.parisc-linux.org for me is: 192.25.206.7.

that is out of date - the correct ip is now .14
-- 

dannf@dannf.org 
