Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9576482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 08:38:27 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id auvglaaa for parisc-linux@lists.parisc-linux.org; Mon, 4 Feb 2002 08:38:17 -0700
Date: Mon, 4 Feb 2002 07:38:17 -0800
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] dump driver for parisc-linux: patch vs CVS
Message-ID: <20020204153817.GI604@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3C5E768A.573CC5A2@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C5E768A.573CC5A2@admin.france.hp.com>
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

> -Do you think it is a good idea to have a dump driver available 
> in the standart kernel ?
> -If yes, who is able to do the code review, and put this dump 
> module in the CVS ?

The usual procedure as I understand it is to post a diff to this list
(cvs diff -uNp from the root of your linux tree). People will try it
out/post comments and once that is done someone can check this in for
you.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
