Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id C18FA482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Apr 2002 17:11:05 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id alckmaaa for parisc-linux@lists.parisc-linux.org; Sat, 6 Apr 2002 17:10:09 -0700
Date: Sat, 6 Apr 2002 16:11:01 -0800
From: Randolph Chung <randolph@tausq.org>
To: Hinrich Aue <H_Aue@t-online.de>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Woody - stable
Message-ID: <20020407001101.GN356@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <16txna-16kV72C@fwd05.sul.t-online.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16txna-16kV72C@fwd05.sul.t-online.com>
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

In reference to a message from Hinrich Aue, dated Apr 06:
> I installed Debian unstable a bit ago. (pa-linux 0.92)
> Now I read on /. that Woody becomes stable.
> I think I use SID (unstable everywhere in sources.list)
> Is it good to use the stable release(Woody) when released?
> What do I have to do? Just change sources.list entries from unstable to 
> stable?

For reference, this type of question should be sent to
debian-hppa@lists.debian.org instead.

You can either change the references of 'unstable' to 'stable' when
woody gets released, or you can change the reference of 'unstable' to
'woody', then you'll always track woody.

Note 'unstable' doesn't become woody, it is 'testing' that is becoming
'woody'.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
