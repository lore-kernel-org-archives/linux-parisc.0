Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0082C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Mar 2003 10:06:43 -0700 (MST)
Date: Wed, 19 Mar 2003 09:03:22 -0800
From: Randolph Chung <randolph@tausq.org>
To: bruno_vidal@hp.com
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] struct page: page in use or not ?
Message-ID: <20030319170322.GI26139@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E789FE6.C9BB53CD@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E789FE6.C9BB53CD@hp.com>
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

> I'm currently trying to reduce the dump time, and then I try to dump only
> pages that are currently use by the system. In page structure I found a flag,
> I was thinking a good one for this purpose:
> atomic_t count;                 /* Usage count, see below. */

Bruno, isn't this handled in the generic dump code? I haven't looked at
this for a while, but I thought the generic dump code lets you configure
whether to dump all kernel pages, all kernel+user referened pages or
all pages whether referenced or not...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
